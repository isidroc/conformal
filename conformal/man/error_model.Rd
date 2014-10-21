\name{error_model}
\alias{error_model}
\title{
	Calculation of an error model
}
\description{
This function permits the calculation of an error model from (i) a training set,
and (ii) a caret model trained on this set 
to predict the response variable of interest using cross-validation (point prediction model).
The cross-validation predictions are extracted from the input model.
The errors in prediction are then calculated, which serve as the response variable 
for the error model.
	The error model uses as descriptors the same descriptors used by the point prediction model,
	input through the argument "PointPredictionModel".
}
\usage{
error_model(PointPredictionModel, x.train, algorithm = "svmRadial", ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{PointPredictionModel}{
Point prediction model from which the cross-validation predictions 
will be extracted.
}
  \item{x.train}{
Descriptors for the datapoints in the training set used to train the point prediction model,
and which will serve to train the error model.
}
  \item{algorithm}{
	  The machine learning algorithm to be used to train the error model. The defaul value is 
	  Support Vector Machine with radial kernel ("svmRadial").
}
  \item{\dots}{
	  Additional arguments that can be passed to the train function from the R package caret 
	  to train the error model.
}
}
\value{
A list of class train containing the error model (caret model).
}
\references{
http://caret.r-forge.r-project.org/training.html

Kuhn (2008), "Building Predictive Models in R Using the caret" (http://www.jstatsoft.org/v28/i05/)
}
\author{
Isidro Cortes-Ciriano <isidrolauscher@gmail.com>
}


\seealso{
	\code{\link{ConformalRegression}}
	\code{\link{GetCVPreds}}
}
\keyword{ ~error model}
