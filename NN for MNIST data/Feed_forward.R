feed_forward = function(x){
        # this function gives activations for a specific input vector
        activations[[1]] = t(as.matrix(x))
        
        for (l in 1:(n_layers-1)) {
                z[[l]] =  weights[[l]] %*% activations[[l]] + biases[[l]] 
                # perform matrix mul tiplication and add b to get z of next layer
                activations[[l+1]] = sigmoid(z[[l]])    
        } 
        list(activations, z)
}
