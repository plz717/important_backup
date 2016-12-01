# -*- coding: utf-8 -*-

from __future__ import division, print_function, absolute_import

import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
import PIL
from PIL import Image
# step 1
filenames = tf.train.match_filenames_once(
    "/home/plz/slam/slam_dq/slam_cloud/slam_server/data/rgb_png/*.png")
# step 2
filename_queue = tf.train.string_input_producer(filenames)

# step 3: read, decode and resize images
reader = tf.WholeFileReader()
filename, content = reader.read(filename_queue)
image = tf.image.decode_png(content, channels=3)
resized_image = tf.image.resize_images(image, 60, 80)
resized_image = tf.image.rgb_to_grayscale(resized_image)

# step 4: Batching
image_batch = tf.train.batch([resized_image], batch_size=16)
files_num = 96
batch_size = 16
total_batch = int(files_num / batch_size)


# Parameters
learning_rate = 0.05
training_epochs = 5
batch_size = 16
display_step = 1
#examples_to_show = 10

# Network Parameters
n_hidden_1 = 2400  # 1st layer num features
n_hidden_2 = 1200  # 2nd layer num features
n_hidden_3 = 600
n_hidden_4 = 300
n_input = 4800  # MNIST data input (img shape: 28*28)

# tf Graph input (only pictures)
X = tf.placeholder("float", [None, n_input])

weights = {
    'encoder_h1': tf.Variable(tf.random_normal([n_input, n_hidden_1])),
    'encoder_h2': tf.Variable(tf.random_normal([n_hidden_1, n_hidden_2])),
    'encoder_h3': tf.Variable(tf.random_normal([n_hidden_2, n_hidden_3])),
    'encoder_h4': tf.Variable(tf.random_normal([n_hidden_3, n_hidden_4])),
    'decoder_h1': tf.Variable(tf.random_normal([n_hidden_4, n_hidden_3])),
    'decoder_h2': tf.Variable(tf.random_normal([n_hidden_3, n_hidden_2])),
    'decoder_h3': tf.Variable(tf.random_normal([n_hidden_2, n_hidden_1])),
    'decoder_h4': tf.Variable(tf.random_normal([n_hidden_1, n_input])),
}
biases = {
    'encoder_b1': tf.Variable(tf.random_normal([n_hidden_1])),
    'encoder_b2': tf.Variable(tf.random_normal([n_hidden_2])),
    'encoder_b3': tf.Variable(tf.random_normal([n_hidden_3])),
    'encoder_b4': tf.Variable(tf.random_normal([n_hidden_4])),
    'decoder_b1': tf.Variable(tf.random_normal([n_hidden_3])),
    'decoder_b2': tf.Variable(tf.random_normal([n_hidden_2])),
    'decoder_b3': tf.Variable(tf.random_normal([n_hidden_1])),
    'decoder_b4': tf.Variable(tf.random_normal([n_input])),
}


# Building the encoder
def encoder(x):
    # Encoder Hidden layer with sigmoid activation #1
    layer_1 = tf.nn.sigmoid(tf.add(tf.matmul(x, weights['encoder_h1']),
                                biases['encoder_b1']))
    # Decoder Hidden layer with sigmoid activation #2
    layer_2 = tf.nn.sigmoid(tf.add(tf.matmul(layer_1, weights['encoder_h2']),
                                biases['encoder_b2']))
    layer_3 = tf.nn.sigmoid(tf.add(tf.matmul(layer_2, weights['encoder_h3']),
                                biases['encoder_b3']))
    layer_4 = tf.nn.sigmoid(tf.add(tf.matmul(layer_3, weights['encoder_h4']),
                                biases['encoder_b4']))
    return layer_4


# Building the decoder
def decoder(x):
    # Encoder Hidden layer with sigmoid activation #1
    layer_1 = tf.nn.sigmoid(tf.add(tf.matmul(x, weights['decoder_h1']),
                                biases['decoder_b1']))
    # Decoder Hidden layer with sigmoid activation #2
    layer_2 = tf.nn.sigmoid(tf.add(tf.matmul(layer_1, weights['decoder_h2']),
                                biases['decoder_b2']))
    layer_3 = tf.nn.sigmoid(tf.add(tf.matmul(layer_2, weights['decoder_h3']),
                                biases['decoder_b3']))
    layer_4 = tf.nn.sigmoid(tf.add(tf.matmul(layer_3, weights['decoder_h4']),
                                   biases['decoder_b4']))
    return layer_4

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
    for epoch in range(training_epochs):
        # Loop over all batches
        for i in range(total_batch):
            batch_xs = image_batch.eval()
            batch_xs = np.reshape(batch_xs, (batch_size, 60, 80))
            batch_xs = np.reshape(batch_xs, (-1, n_input))
            # normalize pixels to 0 and 1. 0—->0, 1-->255.
            batch_xs = [x * 1.0 / 255.0 for x in batch_xs]

            _, c = sess.run([optimizer, cost], feed_dict={X: batch_xs})

    print("Epoch:", '%04d' % (epoch),
          "cost=", "{:.9f}".format(c))
    print(weights['encoder_h1'].eval(session=sess))

    # Finish off the filename queue coordinator.
    coord.request_stop()
    coord.join(threads)

    print("Optimization Finished!")
    save_path = saver.save(sess, "autoencoder_model.ckpt")
    print("Model saved in file: ", save_path)
