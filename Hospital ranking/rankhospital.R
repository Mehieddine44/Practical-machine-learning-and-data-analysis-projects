rankhospital <- function(state, outcome, num = "best") {
       
         ## Read outcome data
        outcome_data <- read.csv("C:/Users/hp/Desktop/Career/My working directory/outcome-of-care-measures.csv",colClasses = "character")
        
        ## Check that state and outcome are valid
        outcome_index = 11*(outcome == "heart attack") + 17*(outcome == "heart failure") + 23*(outcome == "pneumonia")
        if(outcome_index == 0) stop("invalid outcome")
        if(sum(outcome_data$State == state)== 0) stop("invalid state")
        if((num=="best")+(num=="worst")+(num <= length(outcome_data$Hospital.Name)) == 0) return(NA)
        
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
       
       # create a data frame containing all hospitals with their outcome for the given disease in the given state
       df = as.data.frame(cbind(outcome_data[outcome_data$State == state,2],
                                 outcome_data[outcome_data$State == state,outcome_index]))
        colnames(df) <- c("hospital","outcome")
        
        # R creates this data frame with columns as factor vectors, so to be able to manipulate them we must transform
        # the hospital column to character and the outcome column to numeric.
        df$hospital = as.character(df$hospital) 
        # to convert from factor to numeric we need to convert to character first because conversion from factor to 
        # numeric dose not take into consideration the numeric value of the factor variable, rather in maps the levels
        # of the factor variable into integers starting from 1.
        df$outcome = as.character(df$outcome)
        df$outcome = as.numeric(df$outcome)
        
        
        # the num argument can take the charcter values "best" and "worse" in which case we need to determine 
        # a value for it. This expresion similar to a boolean expression would assign the value 1 if num is "best"
        # or would assign the number of hospitals for which the outcome value is availabe.
        if(is.character(num)) num = 1*(num=="best")+ length(df[!is.na(df$outcome),]$outcome)*(num=="worst")
        
        # order is a vector of indecies indicating the increasing order of the outcome vector. To break the ties we used the 
        # corresponding values in the hospital vector. ie : the hospital name with the higher alphabetic order occurs first.
        order = order(df$outcome, df$hospital)
        
        # finally the variable hospital recieves the element of the hospital vector pointed out by the order[num] index. 
        # ie: the index of the hospital with the rank "num" in the ranking based on the given outcome.
        hospital = df[order[num],]$hospital
        hospital
}
