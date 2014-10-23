pkgname <- "conformal"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('conformal')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("ConformalClassification")
### * ConformalClassification

flush(stderr()); flush(stdout())

### Name: ConformalClassification
### Title: Conformal Prediction For Classification
### Aliases: ConformalClassification

### ** Examples

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

trControl <- trainControl(method = "cv",  number=5,savePredictions=TRUE)#,  predict.all=TRUE,keep.forest=TRUE,norm.votes=TRUE)
set.seed(3)
model <- train(LogSDescsTrain, LogSTrain, algorithm,type="classification", trControl=trControl,predict.all=TRUE,keep.forest=TRUE,norm.votes=TRUE)


# Instantiate the class and get the p.values
example <- ConformalClassification$new()
example$CalculateCVAlphas(model=model)
example$CalculatePValues(new.data=LogSDescsTest)
example$p.values$P.values
example$p.values$Significance_p.values




cleanEx()
nameEx("ConformalRegression")
### * ConformalRegression

flush(stderr()); flush(stdout())

### Name: ConformalRegression
### Title: Conformal Prediction for Regression
### Aliases: ConformalRegression

### ** Examples

#############################################
### Example
#############################################

# Optional for parallel training
#library(doMC)
#registerDoMC(cores=4)

data(LogS)

algorithm <- "svmRadial"
tune.grid <- expand.grid(.sigma = expGrid(power.from=-10, power.to=-6, power.by=1, base=2), 
                         .C = expGrid(power.from=4, power.to=10, power.by=2, base=2))
trControl <- trainControl(method = "cv",  number=5,savePredictions=TRUE)
set.seed(3)
model <- train(LogSDescsTrain, LogSTrain, algorithm, 
               tuneGrid=tune.grid, 
               trControl=trControl)


# Train an error model
error_model <- ErrorModel(PointPredictionModel=model,x.train=LogSDescsTrain,
                          savePredictions=TRUE,algorithm=algorithm,
                          trControl=trControl, tune.grid=tune.grid)

# Instantiate the class and get the confidence intervals
example <- ConformalRegression$new()
example$CalculateAlphas(model=model,error_model=error_model,ConformityMeasure=StandardMeasure)
example$GetConfidenceIntervals(new.data=LogSDescsTest)
example$CorrelationPlot(obs=LogSTest)
example$plot






cleanEx()
nameEx("LogS")
### * LogS

flush(stderr()); flush(stdout())

### Name: LogS
### Title: Small Molecule Solubility (LogS) Data
### Aliases: LogS

### ** Examples

# To use the data
data(LogS)



cleanEx()
nameEx("expGrid")
### * expGrid

flush(stderr()); flush(stdout())

### Name: expGrid
### Title: Exponential Grid Definition
### Aliases: expGrid

### ** Examples

expGrid(power.from=-10,power.to=10,power.by=2,base=10)



### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
