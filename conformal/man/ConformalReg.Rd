\name{ConformalReg}
\alias{ConformalReg}

\title{Conformal Prediction for Regression}
\description{
R class to create and visualize confidence intervals for individual 
predictions accorfing to 
the conformal prediction framework.
}
\usage{
ConformalReg(...)
}

\arguments{
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
\details{
}
\value{
}

\references{
}

\author{
Isidro Cortés-Ciriano <isidrolauscher@gmail.com>
}

\note{
%%  ~~further notes~~
}


\seealso{
}
\examples{
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



}

\keyword{ ~ConformalRegression }
%%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
