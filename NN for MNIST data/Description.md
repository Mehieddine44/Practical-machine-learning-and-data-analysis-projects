# introduction: 

This project implements a neural network for classification of handwritten digits using the R language. 

# Data: 

The data used for this project is the MNIST data set which is a set of over 60000 labled images of handwritten digits. 

# Files provided: 

-The code in "File loader.R" will download, gunzip, and help visualize the data. 
-The code in "main.R" contains the code for the training and trsting of the network. 
-The rest of the files contain the code for the functions used in "main.R"

# Algorithm: 

The algorithm used is "stochastic gradient descent", which uses backpropagation.The goal is to calculate the gradient 
of the cost function with respect to all weights and biases.The expression of the gradient's components are shown in 
(BP3) and (BP4). To calculate them we need to calculate the quantity "delta" for every  neuron which is given in (BP1)
for the last layer's neurons , and  (BP2) for the neurons in the remaining of the layers. 
the proof of these equations is easy and can be found in the great book in the link below. 

![alt text](http://url/to/img.png)
