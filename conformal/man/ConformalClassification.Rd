\name{ConformalClassification}
\alias{ConformalClassification}
\title{Conformal Prediction For Classification}
\description{
R reference class to calculate p.values for individual 
predictions according to the conformal prediction framework.
}
\usage{
ConformalClassification(...)
}
\arguments{

}
\details{
}
\value{

}
\references{
Norinder et al. J. Chem. Inf. Model., 2014, 54 (6), pp 1596-1603
DOI: 10.1021/ci5001168
\url{http://pubs.acs.org/doi/abs/10.1021/ci5001168}
}
\author{
Isidro Cortes-Ciriano <isidrolauscher@gmail.com>
}


\seealso{
\code{\link{ConformalRegression}}
}
\examples{
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

}
