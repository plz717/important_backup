#import modules
import sys
import tensorflow as tf
import math
import numpy as np
from PIL import Image, ImageFilter

# Network Parameters
n_hidden_1 = 256 # 1st layer num features
n_hidden_2 = 128 # 2nd layer num features
n_input = 784 # MNIST data input (img shape: 28*28)

weights = {
    'encoder_h1': tf.Variable(tf.random_normal([n_input, n_hidden_1])),
    'encoder_h2': tf.Variable(tf.random_normal([n_hidden_1, n_hidden_2])),
    'decoder_h1': tf.Variable(tf.random_normal([n_hidden_2, n_hidden_1])),
    'decoder_h2': tf.Variable(tf.random_normal([n_hidden_1, n_input])),
}
biases = {
    'encoder_b1': tf.Variable(tf.random_normal([n_hidden_1])),
    'encoder_b2': tf.Variable(tf.random_normal([n_hidden_2])),
    'decoder_b1': tf.Variable(tf.random_normal([n_hidden_1])),
    'decoder_b2': tf.Variable(tf.random_normal([n_input])),
}

#image preprocessing
def imageprepare(argv):
    """
    This function returns the pixel values.
    The imput is a png file location.
    """
    im = Image.open(argv).convert('L')
    width = float(im.size[0])
    height = float(im.size[1])
    newImage = Image.new('L', (28, 28), (255)) #creates white canvas of 28x28 pixels
    
    if width > height: #check which dimension is bigger
        #Width is bigger. Width becomes 20 pixels.
        nheight = int(round((20.0/width*height),0)) #resize height according to ratio width
        if (nheigth == 0): #rare case but minimum is 1 pixel
            nheigth = 1  
        # resize and sharpen
        img = im.resize((20,nheight), Image.ANTIALIAS).filter(ImageFilter.SHARPEN)
        wtop = int(round(((28 - nheight)/2),0)) #caculate horizontal pozition
        newImage.paste(img, (4, wtop)) #paste resized image on white canvas
    else:
        #Height is bigger. Heigth becomes 20 pixels. 
        nwidth = int(round((20.0/height*width),0)) #resize width according to ratio height
        if (nwidth == 0): #rare case but minimum is 1 pixel
            nwidth = 1
         # resize and sharpen
        img = im.resize((nwidth,20), Image.ANTIALIAS).filter(ImageFilter.SHARPEN)
        wleft = int(round(((28 - nwidth)/2),0)) #caculate vertical pozition
        newImage.paste(img, (wleft, 4)) #paste resized image on white canvas
    
    #newImage.save("sample.png")

    tv = list(newImage.getdata()) #get pixel values
    
    #normalize pixels to 0 and 1. 0 is pure white, 1 is pure black.
    tva = [ (255-x)*1.0/255.0 for x in tv] 
    return tva
    #print(tva)
    
# Building the encoder
def encoder(x):
    # Encoder Hidden layer with relu activation #1
	layer_1 = tf.nn.relu(tf.add(tf.matmul(x, weights['encoder_h1']),
                                   biases['encoder_b1']))
    # Decoder Hidden layer with relu activation #2
	layer_2 = tf.nn.relu(tf.add(tf.matmul(layer_1, weights['encoder_h2']),
                                   biases['encoder_b2']))
	return layer_2


def predictint(imvalue):
	x=tf.placeholder(tf.float32,[None,784])
	# encoder
	encoder_x=encoder(x)
	init_op=tf.initialize_all_variables()
	saver=tf.train.Saver()
	
	#load the model file
	with tf.Session() as sess:
		sess.run(init_op)
		saver.restore(sess,"autoencoder_model.ckpt")
		print ("model restored")
		return encoder_x.eval(feed_dict={x: [imvalue]},session=sess)
		
#calculate "cos" value of two vectors

def cos_theta(a,b):
	if len(a) != len(b):
		return "different length of a and b."
	part_up=np.sum(a*b)
	part_down=np.sum(a*a)*np.sum(b*b)
	part_down=np.sqrt(part_down)
	if part_down==0.0:
		return None
	else:
		print ("part down is:", part_down)
		print ("part up is:", part_up)
		return (part_up/part_down)
	
	
#main function
def main(argv):
	imvalue=imageprepare(argv)
	feature=predictint(imvalue)
	return feature
	
if __name__=="__main__":
	feature1=main(sys.argv[1])
	feature2=main(sys.argv[2])
	cos_theta=cos_theta(feature1,feature2)

	print ("cos-theta value of the two features is:",cos_theta)
