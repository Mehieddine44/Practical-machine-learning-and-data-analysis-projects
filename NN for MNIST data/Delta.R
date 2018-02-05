delta = function(){
        
        # calculating delta for the last layer using BP(1)
        deltA[[n_layers - 1]] = cost_prime(X[i,785]) * segmoid_prime(z[[n_layers-1]])
        
        # calculating delta for the rest of the layers using BP(2)
        for (l in seq(from = n_layers-2, to = 1)){
                deltA[[l]] = (t(weights[[l+1]]) %*% deltA[[l+1]])*segmoid_prime(z[[l]])
        }
        deltA
}
