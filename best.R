best <- function(state, outcome) {
        outcome_data <- read.csv("C:/Users/hp/Desktop/Career/My working directory/outcome-of-care-measures.csv")
        
        ## Check that state and outcome are valid
        sum = sum(as.character(outcome_data$State) == as.character(state))
        if(sum == 0) return("invalid state name")
        outcomename = paste("Hospital.30.Day.Death..Mortality..Rates.from.",
                            outcome, sep = "")
        sum2 = sum(colnames(outcome_data)== outcomename)
        if(sum2 == 0) return(sum2)
        
        
       
         ## Return hospital name in that state with lowest 30-day death
         ## rate
        index <- which.min(outcome_data[outcome_data$State== state,
                                        colnames(outcome_data)==outcomename])
        outcome_data[outcome_data$State== state,][index,]$Hospital.Name
        
        }