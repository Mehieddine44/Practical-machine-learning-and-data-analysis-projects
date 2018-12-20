#Introduction: 

the aim of this project is to fit a predictive model that predicts what  type of movement is an athlete doing based on the values
given by multiple sensors attached in the athlete's bodies while they were performing these movements. 

#My appraoch: 

as shown in the source code file I started by loading the data which was in the form of ".csv" files. At the first glance to this 
raw data we can see that it has lots of empty columns or "NA" columns, along with some non numeric data like time series which is
of no use for our prediction. Which means we should perform some preprocessing on it, for it to be of any use for us. 

#Data cleaning: 

we start by saving the" classe" column so that it dose not get affected by the preprocessing. Then we remove the "X" variable
- which is numeric yet it only carries the order of the samples and holds no relevant information for the  the prediction. Then
we remove the "NA" columns, empty columns, and nonnumeric columns respectively, which leaves us with only 56 predictors out of 160.
After that we reattach the "classe" column to our data frame. 

#Data exploring : 

In order to select the best model type we need to know how correlated are our predictors with our outcome. So we perfomed a 
calculation of "Spearman" rank based correlation because we are calculating the correlation with a categorical variable . 
Then we save the correlation of each predictor with the "classe" variable in a object called "M".  

After that we save the two predictors with the most correlation with the outcome in two lists called "maxCor1" and "maxCor2". 
Then we plot them against each other and color the "classe" variable using "qplot": 
