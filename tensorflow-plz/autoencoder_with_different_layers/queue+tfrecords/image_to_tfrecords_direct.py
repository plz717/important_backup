from __future__ import absolute_import
from __future__ import division
from __future__ import print_function


import os
import tensorflow as tf
import numpy as np


tf.app.flags.DEFINE_string('directory',
                           '/home/plz/tensorflow-mnist-predict/data',
                           'Directory to write the converted result')

FLAGS = tf.app.flags.FLAGS


def _int64_feature(value):
    return tf.train.Feature(int64_list=tf.train.Int64List(value=[value]))


def _bytes_feature(value):
    return tf.train.Feature(bytes_list=tf.train.BytesList(value=[value]))


def _list_int64_feature(value):
    # convert all strings in a list to int64
    return map(np.int64, value)


def convert_to_tfrecords(data_set, num_examples, name):
    # convert image batch[batch_num,height,width,1] to tfrecords
    num_examples = data_set.shape[0]
    depth = data_set.shape[3]
    #labels = data_set

    filename = os.path.join(FLAGS.directory, name + '.tfrecords')
    print('Writing', filename)
    writer = tf.python_io.TFRecordWriter(filename)
    for index in range(num_examples):
        image_raw = data_set[index].tostring()
        example = tf.train.Example(features=tf.train.Features(feature={
            'height': _int64_feature(height),
            'width': _int64_feature(width),
            'depth': _int64_feature(depth),
            #'labels': _list_int64_feature(labels[index].tolist()),
            #'labels': _int64_feature(labels[index].tolist()),
            'image_raw': _bytes_feature(image_raw)}))
        writer.write(example.SerializeToString())
    writer.close()


def convert_to_array_queue(files, files_num, height, width, channels):
    # convert files containing multple images in png format to
    # gray_scale images and pack them in
    # image batch[batch_num,height,width,1]
    filenames = tf.train.match_filenames_once(files)
    filename_queue = tf.train.string_input_producer(filenames)

    # step 3: read, decode and resize images
    reader = tf.WholeFileReader()
    filename, content = reader.read(filename_queue)
    image = tf.image.decode_png(content, channels=channels)
    resized_image = tf.image.resize_images(image, height, width)
    gray_images = tf.image.rgb_to_grayscale(resized_image)

    # step 4: Batching
    image_batch = tf.train.batch([gray_images], batch_size=1)
    batch_size = 1
    batch_num = int(files_num / batch_size)

    with tf.Session() as sess_1:
        tf.initialize_all_variables().run()

        coord = tf.train.Coordinator()
        threads = tf.train.start_queue_runners(sess=sess_1, coord=coord)
        image_total = []
        for i in range(batch_num):
            image_tensor = image_batch.eval()  # (1,heightheight,width,1)
            image_array = np.asarray(image_tensor[0])  # (height,widthwidth,1)
            image_total.append(image_array)
        # convert list to array
        image_total = np.array(image_total)  # (batch_num,height,width,1))
        num_examples = image_total.shape[0]

        coord.request_stop()
        coord.join(threads)
    return image_total, num_examples


# parameters
height = 60
width = 80
channels = 3
files = "/home/plz/slam/slam_dq/slam_cloud/slam_server/data/rgb_png/*.png"
files_num = 96
# convert images to array_queue
images, num_examples = convert_to_array_queue(
    files=files, files_num=files_num, height=height,
    width=width, channels=channels)
print(images)
print("num_examples is:", num_examples)
print("images.shape is", images.shape)
# convert image batch[batch_num,height,width,1] to tfrecords
tfrecords = convert_to_tfrecords(
    data_set=images, num_examples=num_examples, name='train')
