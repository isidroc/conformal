\name{ConformalRegression-class}
\Rdversion{1.1}
\docType{class}
\alias{ConformalRegression-class}

\title{Class \code{"ConformalRegression"}: Conformal Prediction for Regression}

\description{
R reference class to create and visualize confidence intervals for individual 
predictions according to 
the conformal prediction framework.
}

\section{Fields}{
  \describe{
      \item{\code{PointPredictionModel}:}{stores a point prediction model.}
      \item{\code{ErrorModel}:}{stores an error model. Error models can be trained with the function \code{\link{ErrorModel}}.}
      \item{\code{confidence}:}{stores the level of confidence used to calculate the confidence intervals. This value is defined when instantiating a new class. Values are in the 0-1 range. Interpretation: for instance, a confidence level of 0.8 (80\%) means that, at most, 20\% of the confidence intervals will not contain the true value.}
      \item{\code{data.new}:}{ stores the descriptors corresponding to an external set.}
      \item{\code{alphas}:}{stores the nonconformity scores for the datapoints used to train the point prediction model (PointPredictionModel) with the method CalculateAlphas.}
      \item{\code{errorPredictions}:}{errors in prediction for an external set predicted with an error model (stored in the field ErrorModel). These errors are generated when calling the method GetConfidenceIntervals. These errors serve to calculate the nonconformity scores (alphas) for the an external set. In the conformal prediction framework, the confidence intervals are derived from the nonconformity values (see methods CalculateAlphas and
	  GetConfidenceIntervals).}
      \item{\code{pointPredictions}:}{point predictions for an external set calculated with the point prediction model (stored in the field PointPredictionModel). These predictions are generated with the method GetConfidenceIntervals.}
      \item{\code{Intervals}:}{numeric vector with the errors in prediction for the external set (data.new) calcu- lated in the conformal prediction framework (not with an error model). These intervals are calculated when calling the method GetConfidenceIntervals.}
      \item{\code{plot}:}{stores a correlation plot for the observed against the predicted values, with individual confidence intervals, for the datapoints in an external set. The plot is a ggplot2 object which can be further customized. The plot is generated with the method CorrelationPlot.}
    }
}
\section{Methods}{
  \describe{
      \item{\code{initialize(confi)}:}{ this method is called when you create an instance of the class. The default value for the confidence level is 0.8.}
      \item{\code{CalculateAlphas(model, error_model, ConformityMeasure)}:}{ this method calculates the vector of nonconformity scores for the datapoints in the traning set. These scores (or alphas) are stored in the field alphas. This method requires a point prediction model (argument model), an error model (argument error_model), and a nonconformity measure (argument ConformityMeasure), such as \code{\link{StandardMeasure}}.}
      \item{\code{GetConfidenceIntervals(new.data)}:}{this methods calculates confidence intervals for individual predictions in the conformal prediction framework. The methods requires an external set for which the confidence intervals will be calculated. The dimensionality of these descriptors must be the same as the one used for the datapoints used to train the point prediction and the error model. The method uses the point prediciton and the error models stored in the
	  fields PointPredictionModel and ErrorModel, respectively. Confidence intervals are calculated according to Norinder et al. 2014. Confidence intervals are defined as: point predictions (stored in the field pointPredictions) +/- the output of the method GetConfidenceIntervals, which is stored in the field intervals.}
      \item{\code{CorrelationPlot()}:}{ this method generates a correlation plot for the observed against the predicted values for an external set, along with individual confidence intervals. The plot is stored in the field plot.}
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
\link{ConformalRegression}
\link{ConformalClassification}
\link{ConformalClassification-class}
\code{\link{conformal}}
}






