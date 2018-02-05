gradient = function(){
        # nabla_b is the gradient of the cost function for biases
        nabla_b = deltA
        
        # calculating nabla_w which is the gradient of the cost function
        # for weights
        for (l in 1:(n_layers-1)){
                Gr = NULL
                for(k in 1:layers_sizes[[l]]){
                         Gr = cbind(Gr,deltA[[l]]*activations[[l]][k])
                }
                nabla_w[[l]] = Gr
        }
        list(nabla_w,nabla_b)
}




