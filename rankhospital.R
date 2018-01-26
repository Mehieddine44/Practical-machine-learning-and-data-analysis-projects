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
        df = as.data.frame(cbind(outcome_data[outcome_data$State == state,2],
                                 outcome_data[outcome_data$State == state,outcome_index]))
        colnames(df) <- c("hospital","outcome")
        
        df$hospital = as.character(df$hospital) 
        df$outcome = as.character(df$outcome)
         
        df$outcome = as.numeric(df$outcome)
        
        
        
        if(is.character(num)) num = 1*(num=="best")+length(df[!is.na(df$outcome),]$outcome)*(num=="worst")
        
        order = order(df$outcome, df$hospital)
        
        hospitals = df[order[num],]$hospital
        hospitals
}
