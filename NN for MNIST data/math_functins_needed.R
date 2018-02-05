sigmoid = function(z) {
        1/(1+exp(-z))
}
segmoid_prime = function(z){
        sigmoid(z)*(1-sigmoid(z))
}
cost_prime = function(y){
        output[y]=1 
        output - activations[[n_layers]]
        
}
