# -*- coding: utf-8 -*-
#import modules
import sys
import tensorflow as tf
import math
import numpy as np
from PIL import Image, ImageFilter
#强制打印整个数组
np.set_printoptions(threshold='nan')

# Parameters
learning_rate = 0.0001
batch_size = 16
files_num=96
batch_size=16
total_batch=int(files_num/batch_size)

# Network Parameters
n_hidden_1 = 2400 # 1st layer num features
n_input = 4800 # MNIST data input (img shape: 28*28)

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


#image preprocessing
def imageprepare(argv):
    """
    This function returns the pixel values.
    The imput is a png file location.
    """
    im_test = Image.open(argv).convert("L")    #uint8
    im_test = im_test.resize((80,60), Image.ANTIALIAS)
    print(im_test)	
    im_test=np.reshape(im_test,(-1,n_input))
    im_test=im_test.astype(np.float32)
    #normalize pixels to 0 and 1. 0—->0, 1-->255.
    im_test=[x*1.0/255.0 for x in im_test]
    return im_test
    

def predictint(imvalue):
	x=tf.placeholder(tf.float32,[None,n_input])
	# encoder
	encoder_x=encoder(x)
	decoder_x=decoder(encoder_x)
	init_op=tf.initialize_all_variables()
	saver=tf.train.Saver()
	
	#load the model file
	with tf.Session() as sess:
		sess.run(init_op)
		saver.restore(sess,"autoencoder_model.ckpt")
		print ("model restored")
		return decoder_x.eval(feed_dict={x: imvalue},session=sess)
		
	
#main function
def main(argv):
	imvalue=imageprepare(argv)
	pred_img=predictint(imvalue)
	return pred_img
	
if __name__=="__main__":
	pred_img=main(sys.argv[1])
	print(pred_img.dtype)
	
	pred_img=[255.0*y for y in pred_img]
	pred_img = np.reshape(pred_img, (60, 80))
	print(pred_img)
	pred_img=pred_img.astype(np.uint8)   #convert into "L"
	
	#print(pred_img)
	pred_img=Image.fromarray(pred_img)
	print(pred_img.mode)
	pred_img.show()
	

