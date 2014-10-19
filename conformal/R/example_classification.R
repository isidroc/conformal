# Optional for parallel training
#library(doMC)
#registerDoMC(cores=4)


data(LogS)

# convert data to categorical
LogSTrain[LogSTrain > -4] <- 1
LogSTrain[LogSTrain <= -4] <- 2
LogSTest[LogSTest > -4] <- 1
LogSTest[LogSTest <= -4] <- 2

LogSTrain <- factor(LogSTrain)
LogSTest <- factor(LogSTest)

algorithm <- "rf"

trControl <- trainControl(method = "cv",  number=5,savePredictions=TRUE, 
                          predict.all=TRUE,keep.forest=TRUE,norm.votes=TRUE)
set.seed(3)
# we specify importance=TRUE to keep the predictions of the trees in the forest
model <- train(LogSDescsTrain, LogSTrain, algorithm,type="classification", 
               trControl=trControl)

model$finalModel$ntree 
predd <- GetCVPreds(model)
dim(predd)

GetMondrianICP <- function(model=NULL){
}


# Instantiate the class and get the confidence intervals
example <- ConformalClassification$new()
example$CalculateCVAlphas(model=model)
example$CalculatePValues(new.data=LogSDescsTest)
example$p.values$P.values
example$p.values$Significance_p.values
