\name{ConformalRegression}
\alias{ConformalRegression}

\title{Class ConformalRegression: Conformal Prediction for Regression}

\description{
R reference class to create and visualize confidence intervals for individual 
predictions according to 
the conformal prediction framework.
}


\details{
The reference class ConformalRegression contains the following fields:
\itemize{
\item  PointPredictionModel: stores a point prediction model.
\item  ErrorModel: stores an error model. Error models can be trained with the function \code{\link{ErrorModel}}.
\item  confidence: stores the level of confidence used to calculate the confidence intervals. This value is defined when instantiating a new class. Values are in the 0-1 range. 
Interpretation: for instance, a confidence level of 0.8 (80\%) means that, at most, 20\% of the confidence intervals will not contain the 
true value.
\item  data.new: stores the descriptors corresponding to an external set.
\item  alphas: stores the nonconformity scores for the datapoints used to train the point prediction model (PointPredictionModel) with the method CalculateAlphas.
\item  errorPredictions: errors in prediction for an external set predicted with an error model (stored in the field ErrorModel). These errors are generated when calling the method GetConfidenceIntervals. These errors serve to calculate the nonconformity scores (alphas) for the an external set. 
In the conformal prediction framework, the confidence intervals are derived from the nonconformity values (see methods CalculateAlphas and GetConfidenceIntervals).
\item  pointPredictions: point predictions for an external set calculated with the point prediction model (stored in the field PointPredictionModel).
These predictions are generated with the method GetConfidenceIntervals.
\item    intervals: numeric vector with the errors in prediction for the external set (data.new) calculated in the conformal prediction framework (not with an error model).
These intervals are calculated when calling the method GetConfidenceIntervals.
\item  plot: stores a correlation plot for the observed against the predicted values, with individual confidence intervals, for the datapoints in an external set. The plot is a ggplot2 object which can be further customized. The plot is generated with the method CorrelationPlot.
}

The class ConformalRegression contains the following methods:
\itemize{
\item  initialize: this method is called when you create an instance of the class. The default value for the confidence level is 0.8.
\item   CalculateAlphas: this method calculates the vector of nonconformity scores for the datapoints in the traning set. These scores (or alphas) are stored in the field alphas. This method requires a point prediction model (argument model),
an error model (argument error_model), and a nonconformity measure (argument ConformityMeasure), such as \code{\link{StandardMeasure}}.
\item  GetConfidenceIntervals: this methods calculates confidence intervals for individual predictions in the conformal prediction framework. The methods requires an external set for which the confidence intervals will be calculated.
The dimensionality of these descriptors must be the same as the one used for the datapoints used to train the point prediction and the error model. 
The method uses the point prediciton and the error models stored in the fields PointPredictionModel and ErrorModel, respectively.
Confidence intervals are calculated according to Norinder et al. 2014. 
Confidence intervals are defined as: point predictions (stored in the field pointPredictions) +/-  the output of the method GetConfidenceIntervals, which is stored in the field intervals.
\item  CorrelationPlot: this method generates a correlation plot for the observed against the predicted values for an external set, along with individual confidence intervals. The plot is stored in the field plot. The defult values for the arguments are: obs=NULL, pred=pointPredictions, intervals=Intervals, margin = NULL, main = "", ylab = "Predicted", xlab = "Observed", PointSize =3, ColMargin = "blue", ErrorBarCol= "red", ErrorBarSize = 0.5, ErrorBarWidth = 0.5, ErrorBarPosition= "identity", ErrorBarStat = "identity",TextSize = 15, TitleSize = 18, XAxisSize = 18, YAxisSize = 18, TitleAxesSize = 18, ErrorBarAlpha=0.8, tmar = 1, bmar = 1, rmar = 1, lmar = 1, AngleLabX = 0, PointColor = "black", PointAlpha
= 1, PointShape = 15, MarginWidth = 1.
}
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
\link{ConformalRegression-class}
\link{ConformalClassification}
\link{ConformalClassification-class}
\code{\link{conformal}}
}





\examples{

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

}

