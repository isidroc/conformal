\name{ConformalClassification-class}
\Rdversion{1.1}
\docType{class}
\alias{ConformalClassification-class}

\title{Class \code{"ConformalClassification"}: Conformal Prediction for Classification}

\description{
R reference class to calculate p.values for individual 
predictions according to the conformal prediction framework.
}
\section{Extends}{
All reference classes extend and inherit methods from \code{"\linkS4class{ConformalClassification}"}.
}


\section{Fields}{
  \describe{
      \item{\code{ClassificationModel}:}{stores a classification Random Forest model.}
      \item{\code{confidence}:}{stores the user-defined confidence level.}
      \item{\code{data.new}:}{stores the descriptors corresponding to an external set.}
      \item{\code{NonconformityScoresMatrix}:}{stores the non conformity scores matrix.}
      \item{\code{ClassPredictions}:}{ stores the class predictions calculated for the external set.}
      \item{\code{p.values}:}{p.values: a \code{list} storing the p.values and their significance (see section Details)}
    }
}
\section{Methods}{
  \describe{
      \item{\code{initialize(confi)}:}{ this method is called when you create an instance of the class. The default value for the confidence level is 0.8.}
      \item{\code{CalculatePValues(new.data)}:}{ this method calculates the p.values for the datapoints in a external set. The class predictions are stored in the field ClassPredictions, whereas the p.values and their significance, according to the user defined confidence level, are stored in the field p.values.}
      \item{\code{CalculateCVScores(model)}:}{ this method calculates the non conformitity scores (or probabilities) matrix from the cross-validation predictions of the input randomForest model (trained with k-fold cross-validation). The non conformity scores matrix is stored in the field NonconformityScoresMatrix. }
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
\link{ConformalClassification}
\code{\link{ConformalRegression}}
\link{ConformalRegression-class}
}





