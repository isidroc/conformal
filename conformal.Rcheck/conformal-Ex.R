pkgname <- "conformal"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('conformal')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("ConformalReg")
### * ConformalReg

flush(stderr()); flush(stdout())

### Name: ConformalReg
### Title: Conformal Prediction for Regression
### Aliases: ConformalReg
### Keywords: ~ConformalRegression

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
ErrorModel <- error_model(PointPredictionModel=model,x.train=,LogSDescsTrain,
                          savePredictions=TRUE,algorithm=algorithm,
                          trControl=trControl, tune.grid=tune.grid)

# Instantiate the class and get the confidence intervals
example <- ConformalReg$new()
example$CalculateAlphas(model=model,error_model=ErrorModel,ConformityMeasure=StandardMeasure)
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
### Keywords: datasets

### ** Examples

data(LogS)
## maybe str(LogS) ; plot(LogS) ...



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
