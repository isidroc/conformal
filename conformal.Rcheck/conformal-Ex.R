pkgname <- "conformal"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "conformal-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('conformal')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("ConformalClassification")
### * ConformalClassification

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: ConformalClassification
### Title: Class Conformal Prediction for Classification
### Aliases: ConformalClassification

### ** Examples

showClass("ConformalClassification")

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

# Remove part of the data to allow for quick training
LogSTrain <- LogSTrain[1:20]
LogSTest <- LogSTest[1:20]
LogSDescsTrain <- LogSDescsTrain[1:20,]
LogSDescsTest <- LogSDescsTest[1:20,]

algorithm <- "rf"

trControl <- trainControl(method = "cv",  number=5,savePredictions=TRUE)
set.seed(3)

#number of trees
nb_trees <- 100
model <- train(LogSDescsTrain, LogSTrain, 
         algorithm,type="classification", 
         trControl=trControl,predict.all=TRUE,
         keep.forest=TRUE,norm.votes=TRUE,
         ntree=nb_trees)


# Instantiate the class and get the p.values
example <- ConformalClassification$new()
example$CalculateCVScores(model=model)
example$CalculatePValues(new.data=LogSDescsTest)
# we get the p.values:
example$p.values$P.values
# we get the significance of these p.values.
example$p.values$Significance_p.values




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("ConformalClassification", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("ConformalRegression")
### * ConformalRegression

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: ConformalRegression
### Title: Class ConformalRegression: Conformal Prediction for Regression
### Aliases: ConformalRegression

### ** Examples


showClass("ConformalRegression")
#############################################
### Example
#############################################

# Optional for parallel training
#library(doMC)
#registerDoMC(cores=4)

data(LogS)

# Remove part of the data to allow for quick training
LogSTrain <- LogSTrain[1:20]
LogSTest <- LogSTest[1:20]
LogSDescsTrain <- LogSDescsTrain[1:20,]
LogSDescsTest <- LogSDescsTest[1:20,]

algorithm <- "svmRadial"
tune.grid <- expand.grid(.sigma = expGrid(power.from=-10, power.to=-6, power.by=2, base=2), 
                         .C = c(1,10,100))
trControl <- trainControl(method = "cv",  number=5,savePredictions=TRUE)
set.seed(1)
model <- train(LogSDescsTrain, LogSTrain, algorithm, 
               tuneGrid=tune.grid, 
               trControl=trControl)


# Train an error model
error_model <- ErrorModel(PointPredictionModel=model,x.train=LogSDescsTrain,
                          savePredictions=TRUE,algorithm=algorithm,
                          trControl=trControl, 
                          tune.grid=tune.grid)

# Instantiate the class and get the confidence intervals
example <- ConformalRegression$new()
example$CalculateAlphas(model=model,error_model=error_model,ConformityMeasure=StandardMeasure)
example$GetConfidenceIntervals(new.data=LogSDescsTest)
example$CorrelationPlot(obs=LogSTest)
example$plot




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("ConformalRegression", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("LogS")
### * LogS

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: LogS
### Title: Small Molecule Solubility (LogS) Data
### Aliases: LogS

### ** Examples

# To use the data
data(LogS)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("LogS", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("expGrid")
### * expGrid

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: expGrid
### Title: Exponential Grid Definition
### Aliases: expGrid

### ** Examples

expGrid(power.from=-10,power.to=10,power.by=2,base=10)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("expGrid", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
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
