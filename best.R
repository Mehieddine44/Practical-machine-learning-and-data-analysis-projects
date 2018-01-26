best <- function(state, outcome) {
        # reading the data file using read.csv() function.
        outcome_data <- read.csv("C:/Users/hp/Desktop/Career/My working directory/outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        sum = sum(as.character(outcome_data$State) == as.character(state))
        if(sum == 0) return("invalid state name")
        
        outcome_index = 11*(outcome == "heart attack") + 17*(outcome == "heart failure") + 23*(outcome == "pneumonia")
        if(outcome_index == 0) stop("invalid outcome")
        
        
       
         ## Return hospital name in that state with lowest 30-day death
         ## rate
        index_of_best <- which.min(outcome_data[outcome_data$State== state,
                                        outcome_index])
        outcome_data[outcome_data$State== state,][index_of_best,]$Hospital.Name
        
        }
