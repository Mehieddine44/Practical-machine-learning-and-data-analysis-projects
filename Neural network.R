# initializing all the needed lists and variablesas global variables
layers_sizes = list(784,30,10)
output = rnorm(10)*0
n_layers = length(layers_sizes)
neta = 3

biases = list()
weights = list()
activations = list()
z = list()
deltA = list()
nabla_w = list()
nabla_b = list()
mini_batches = list()
sum_grad_w = list()
sum_grad_b = list()

length(biases) = n_layers - 1
length(weights) = n_layers - 1
length(activations) = n_layers
length(z) = n_layers - 1
length(deltA) = n_layers-1
length(nabla_w) = n_layers - 1
length(nabla_b) = n_layers - 1
length(sum_grad_w) = n_layers - 1
length(sum_grad_b) = n_layers - 1
length(mini_batches) = 600

# loop for intialization of biases and weights
for (l in 2:n_layers){
        biases[[l-1]] = rnorm(layers_sizes[[l]])
        weights[[l-1]] = matrix(rnorm(layers_sizes[[l-1]]*layers_sizes[[l]]),
                                nrow = layers_sizes[[l]], ncol = layers_sizes[[l-1]])
}

# Initilizing lists with the same shape as weights[[]] and biases[[]]
# respectively, as they weill carry the sum of the gradients calculated
# for each mini batch
sum_grad_w = weights 
sum_grad_b = biases

# making the matrices in the previous lists zero matrices
for (l in 1:(n_layers-1)){
        sum_grad_w[[l]][] = 0
        sum_grad_b[[l]][] = 0 
}

# sampling out training data into mini batches
for(l in 1:600){
        mini_batches[[l]] = train[100*(l-1)+1:100*(l-1)+100,] 
}

# m in the length of the mini batch
m = length(mini_batches[[1]][,1])

# loop through the epochs
for(e in 1:20){
        #loop through the mini batches in the training set
        for(X in mini_batches){        
                # loop through samples in the mini batch
                for(i in 1:m){
                        
                        # feed_forward() returns a list with two elements containing
                        # the list of activations and the list of neuron inputs resulting 
                        # from the ith sample in the mini batch
                        activations = feed_forward(X[i,1:784])[[1]]
                        z = feed_forward(X[i,1:784])[[2]]
                        
                        # delta() returns the list of (delta = dZ/dC) for each neuron in each layer 
                        deltA = delta()
                        
                        # gradient() returns a list containing two elements which are 
                        # a list for the gradient of weights and a list for the gradient of biases
                        grad = gradient() 
                        
                        # loop through the layers and add the gradient resulting from the ith
                        # sample to the total sum of gradients resulting from the mini batch
                        for(l in 1:(n_layers-1)){
                                sum_grad_w[[l]] = sum_grad_w[[l]] + grad[[1]][[l]]
                                sum_grad_b[[l]] = sum_grad_b[[l]] + grad[[2]][[l]]
                        }
                }
                # loop through the layers and update the weights and biases
                for (l in 1:(n_layers-1)){
                        weights[[l]] = weights[[l]] - neta*(sum_grad_w[[l]]/m)
                        biases[[l]] = biases[[l]] - neta*(sum_grad_b[[l]]/m)
                }
        }
}
# initializing a numeric vector containing the predicted values for test samples
value_predicted = numeric()
length(value_prdicted) = 10000

# each element is the index of the final layer neuron with the highest activation
for (i in 1:10000) {
        value_predicted[i] = which.max(feed_forward(test[i,1:784])[[1]][[n_layers]])
        
}

# result is the number of the samples predicted correctly
result = sum(test[,785]== value_predicted)






