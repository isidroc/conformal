\name{GetCVPreds}
\alias{GetCVPreds}
\title{Extract the cross-validation predictions for the datapoints in the training set
}
\description{
	This function extracts the cross-validation predictions from a caret model trained with cross-validation.
	If grid-search is used to optimize the hyperparamter values,
	the function GetCVPreds extracts the cross-validation predictions corresponding to the optimal hyperparameter values.
}
\usage{
GetCVPreds(model)
}
\arguments{
  \item{model}{
A caret model trained with cross-validation.
}
}
\value{
	A data frame containing the observed and the predicted values for the datapoints in the training set,
	their index according to the training set, the optimal hyperparameter values, and the fold index.
}
\author{
Isidro Cortes-Ciriano <isidrolauscher@gmail.com>
}
