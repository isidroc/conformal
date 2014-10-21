\name{StandardMeasure}
\alias{StandardMeasure}
\title{Default Nonconformity measure used in regression (ConformalRegression class)
}
\description{
Nonconformity measure used by default in the class ConformalRegression to calculate nonconformity scores (alpha).
\code{\link{StandardMeasure}} implements the following nonconformity measure:

alpha = |obs - pred| / pred_error

where alpha is the nonconformity measure, 
obs is the observed value,
pred the predicted value with a point prediction model,
and pred_error is the error in prediction predicted with an error model.
See \code{\link{conformal}} for further information about how to derive individual confidence intervals.
}
\usage{
StandardMeasure(obs, pred, error)
}
\arguments{
  \item{obs}{
Observed values for the response variable.
}
  \item{pred}{
Predicted values for the response variable.
}
  \item{error}{
Predicted errors calculated with an error model.
}
}
\value{
A numeric vector with the nonconformity scores (alpha).
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
