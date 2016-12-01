# -*- coding: utf-8 -*-

from __future__ import division, print_function, absolute_import

import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
import PIL
from PIL import Image
from my_image_dataset import image_dataset
# step 1
filenames = tf.train.match_filenames_once(
    "/home/plz/slam/slam_dq/slam_cloud/slam_server/data/rgb_png/*.png")
# step 2
filename_queue = tf.train.string_input_producer(filenames)
height = 60
width = 80

# step 3: read, decode and resize images
reader = tf.WholeFileReader()
filename, content = reader.read(filename_queue)
image = tf.image.decode_png(content, channels=3)
resized_image = tf.image.resize_images(image, 60, 80)
resized_image = tf.image.rgb_to_grayscale(resized_image)

# step 4: Batching
image_batch_1 = tf.train.batch([resized_image], batch_size=1)
files_num = 96
batch_size = 1
total_batch = int(files_num / batch_size)


# Parameters
learning_rate = 0.0001
training_epochs = 5


# Network Parameters
n_hidden_1 = 2400  # 1st layer num features
# n_hidden_2 = 1200  # 2nd layer num features
# n_hidden_3 = 600
# n_hidden_4 = 300
n_input = 4800  # MNIST data input (img shape: 28*28)

# tf Graph input (only pictures)
X = tf.placeholder("float", [None, n_input])

weights = {
    'encoder_h1': tf.Variable(tf.random_normal([n_input, n_hidden_1])),
    'decoder_h1': tf.Variable(tf.random_normal([n_hidden_1, n_input])),
}
biases = {
    'encoder_b1': tf.Variable(tf.random_normal([n_hidden_1])),
    'decoder_b1': tf.Variable(tf.random_normal([n_input])),
}


# Building the encoder
def encoder(x):
    # Encoder Hidden layer with sigmoid activation #1
    layer_1 = tf.nn.sigmoid(tf.add(tf.matmul(x, weights['encoder_h1']),
                                   biases['encoder_b1']))
    return layer_1


# Building the decoder
def decoder(x):
    # Encoder Hidden layer with sigmoid activation #1
    layer_1 = tf.nn.sigmoid(tf.add(tf.matmul(x, weights['decoder_h1']),
                                   biases['decoder_b1']))
    return layer_1


# Construct model
encoder_op = encoder(X)
decoder_op = decoder(encoder_op)

# Prediction
y_pred = decoder_op
# Targets (Labels) are the input data.
y_true = X

# Define loss and optimizer, minimize the squared error
cost = tf.reduce_mean(tf.pow(y_true - y_pred, 2))
optimizer = tf.train.RMSPropOptimizer(learning_rate).minimize(cost)

# Initializing the variables
init = tf.initialize_all_variables()
saver = tf.train.Saver()

# Launch the graph
with tf.Session() as sess:
    sess.run(init)
    coord = tf.train.Coordinator()
    threads = tf.train.start_queue_runners(sess=sess, coord=coord)
    # Training cycle
    image_total = []
    for i in range(total_batch):
        batch_xs = image_batch_1.eval()
        image_array = np.asarray(batch_xs[0])
        image_array = np.reshape(image_array, (height * width))
        print(len(image_array))
        image_total.append(image_array)
    image_total = np.array(image_total)
    print(image_total.shape)

    image_batches = image_dataset(image_total, image_total)
    print("num_examples = %d" % image_batches._num_examples)

    for epoch in range(training_epochs):
        for i in range(total_batch):
            batch_xs, batch_ys = image_batches.next_batch(1)
            _, c = sess.run([optimizer, cost], feed_dict={X: batch_xs})
            
            print("Epoch:", '%04d' % (epoch),
          "cost=", "{:.9f}".format(c))
    
    print(weights['encoder_h1'].eval(session=sess))
    print(weights['decoder_h1'].eval(session=sess))
    # Finish off the filename queue coordinator.
    coord.request_stop()
    coord.join(threads)

    print("Optimization Finished!")
    save_path = saver.save(sess, "autoencoder_model.ckpt")
    print("Model saved in file: ", save_path)
