library(caret)
library(plyr)
library(splines)
library(parallel)
library(gbm)

# loading the training and test data files from their directory
data <- read.csv("C:/Users/hp/Desktop/Coursera/pml-training.csv")
test <- read.csv("C:/Users/hp/Desktop/Coursera/pml-testing.csv")

#saving the classe column 
classe = data$classe

#Data cleaning :
# Removing the "X" variable :
data <- data[, -1]
# Rmoving columns with at least one NA in them
data <- data[, colSums(!is.na(data))==19622]
# Removing empty columns
data <- data[, colSums(data !="")== 19622]
# Removing non numeric columns
data <- data[, sapply(data, is.numeric)]
# Attaching the classe column to my data again
data$classe = classe

# data exploring :

# calculating correlation of predictors with the outcome :
M <- abs(sapply(colnames(data[,-56]),
                   function(x) cor(as.numeric(training[, x]),
                   as.numeric(data$classe),method = "spearman")))

# finding predictors with maximum correlation with "classe":
maxCor1 <-data[, names(which.max(M))]
maxCor2 <-data[, names(which.max(M[-which.max(M)]))]  
df = data.frame(classe,maxCor1,maxCor2)

#plotting predictors with maximum correlation with "classe" :
qq <- qplot(maxCor1, maxCor2,colour=classe,data=df, size=I(0.0001))



# Data partition into test set and training set
inTrain <- createDataPartition(data$classe, p=0.6, list=FALSE)
training <- data[inTrain, ]
testing <- data[-inTrain, ]

#Model fitting :

# Setting the trainControl parameters
trc <- trainControl(method = "repeatedcv",number = 5,repeats = 3)
# Fitting a gbm model
mod <- train(classe ~ ., data=training, method = "gbm",
             trControl = trc,verbose = FALSE)


# Predicting on the testing set
modPredTest <- predict(mod, newdata = testing)
# Calculating the confusion matrix
modAccuracyTest <- confusionMatrix(modPredTest, testing$classe)
modAccuracyTest

# predicting on the 20 test samples given :
modPredTest2 <- predict(mod, newdata=test)


