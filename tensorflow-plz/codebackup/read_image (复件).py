import tensorflow as tf
import PIL
from PIL import Image
import numpy as np
from my_image_dataset import image_dataset

height = 60
width = 80
# step 1
filenames = tf.train.match_filenames_once(
    "/home/plz/slam/slam_dq/slam_cloud/slam_server/data/rgb_png/*.png")
# step 2
filename_queue = tf.train.string_input_producer(filenames)

# step 3: read, decode and resize images
reader = tf.WholeFileReader()
filename, content = reader.read(filename_queue)
image = tf.image.decode_png(content, channels=3)
resized_image = tf.image.resize_images(image, height, width)
gray_image = tf.image.rgb_to_grayscale(resized_image)

# step 4: Batching
image_batch = tf.train.batch([gray_image], batch_size=1)
files_num = 96
batch_size = 1
batch_num = files_num / batch_size


with tf.Session() as sess_1:
    tf.initialize_all_variables().run()

    coord = tf.train.Coordinator()
    threads = tf.train.start_queue_runners(sess=sess_1, coord=coord)
    image_total = []
    # Get an image tensor and print its value.
    for i in range(batch_num):
        image_tensor = image_batch.eval()
        print(image_tensor.shape)  # (1, 60, 80, 1)
        image_array = np.asarray(image_tensor[0])
        print(image_array.shape)  # (60, 80, 1)
        image_array = np.reshape(image_array, (height * width))
        print(image_array.shape)  # (4800,)
        print(len(image_array))  # 4800
        image_total.append(image_array)
    image_total = np.array(image_total)  # convert list to array
    print(image_total.shape)  # (96,4800)

    image_batch = image_dataset(image_total, image_total)
    print("num_examples = %d" % image_batch._num_examples)

    for i in range(batch_num):
        batch_xs, batch_ys = image_batch.next_batch(1)
        print(batch_xs)

    # Finish off the filename queue coordinator.
    coord.request_stop()
    coord.join(threads)
