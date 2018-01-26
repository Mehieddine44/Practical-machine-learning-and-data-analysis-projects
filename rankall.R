rankall <- function(outcome, num = "best") {
        ## Read outcome data
        outcome_data <- read.csv("C:/Users/hp/Desktop/Career/My working directory/outcome-of-care-measures.csv",colClasses = "character")
        
        ## Check that state and outcome are valid
        outcome_index = 11*(outcome == "heart attack") + 17*(outcome == "heart failure") + 23*(outcome == "pneumonia")
        if(outcome_index == 0) stop("invalid outcome")
        if((num=="best")+(num=="worst")+(num <= length(outcome_data$Hospital.Name)) == 0) return(NA)
        
        ## For each state, find the hospital of the given rank
        l = split(outcome_data[,outcome_index],as.factor(outcome_data$State))
        hospitals = NULL
       
         for (state in names(l)) {
                df = as.data.frame(cbind(outcome_data[outcome_data$State == state,2],
                                         outcome_data[outcome_data$State == state,outcome_index]))
                colnames(df) <- c("hospital","outcome")
                
                df$hospital = as.character(df$hospital) 
                df$outcome = as.character(df$outcome)
                df$outcome = as.numeric(df$outcome)
                
                if(is.character(num)) temp_num = 1*(num=="best")+length(df[!is.na(df$outcome),]$outcome)*(num=="worst")
                else temp_num = num
                
                order = order(df$outcome, df$hospital)
                
                hospital = df[order[temp_num],]$hospital

                hospitals = c(hospitals,hospital)
                
         }
        
        
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        df = as.data.frame(cbind(hospitals,names(l)))
        colnames(df) = c("hospital", "state")
        df
}