from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import os
import tensorflow as tf
import numpy as np
import image_to_array_queue
from image_to_array_queue import convert_to_array_queue

tf.app.flags.DEFINE_string('directory',
                           '/home/plz/tensorflow-mnist-predict/data',
                           'Directory to write the converted result')

FLAGS = tf.app.flags.FLAGS


def _int64_feature(value):
    return tf.train.Feature(int64_list=tf.train.Int64List(value=[value]))


def _bytes_feature(value):
    return tf.train.Feature(bytes_list=tf.train.BytesList(value=[value]))


def convert_to_tfrecords(data_set, name):
    #num_examples = data_set.shape[0]
    num_examples = 96
    depth = data_set.shape[3]

    filename = os.path.join(FLAGS.directory, name + '.tfrecords')
    print('Writing', filename)
    writer = tf.python_io.TFRecordWriter(filename)
    for index in range(num_examples):
        image_raw = data_set[index].tostring()
        example = tf.train.Example(features=tf.train.Features(feature={
            'height': _int64_feature(height),
            'width': _int64_feature(width),
            'depth': _int64_feature(depth),
            'image_raw': _bytes_feature(image_raw)}))
        writer.write(example.SerializeToString())
    writer.close()


height = 60
width = 80
channels = 3
files = "/home/plz/slam/slam_dq/slam_cloud/slam_server/data/rgb_png/*.png"
files_num = 96

images = image_to_array_queue.convert_to_array_queue(
    files=files, files_num=files_num, height=height,
    width=width, channels=channels)

images_array = np.array(images)
print(images[0])
print(len(images[0]))
print(images[1])
print(len(images[1]))
#tfrecords = convert_to_tfrecords(data_set=images_array, name='train')
