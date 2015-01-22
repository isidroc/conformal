\name{ConformalClassification}
\alias{ConformalClassification}

\title{Class Conformal Prediction for Classification}

\description{
R reference class to calculate p.values for individual 
predictions according to the conformal prediction framework.
}

\details{
The reference class ConformalClassification contains the following fields:
\itemize{
\item ClassificationModel: stores a classification Random Forest model.
\item confidence: stores the user-defined confidence level.
\item data.new: stores the descriptors corresponding to an external set.
\item NonconformityScoresMatrix: stores the non conformity scores matrix.
\item ClassPredictions: stores the class predictions calculated for the external set.
\item p.values: a list storing
     \itemize{
		\item P.values: a data.frame containing the p.values calculated for the external set. 
		Rows are indexed by datapoints, whereas columns are indexed by classes.
		The names of the rows correspond to the names of the rows in the external set.
		 \item Significance_p.values: a data.frame reporting the significance of the p.values (where 1 means significant, and 0 not significant),
		 according to the user-defined confidence level, \eqn{\epsilon} (the default value is 0.8).
		Rows are indexed by datapoints, whereas columns are indexed by classes.
		The names of the rows correspond to the names of the rows in the external set.
	 }
}

The class ConformalClassification contains the following methods:
\itemize{
\item initialize: this method is called when you create an instance of the class. The default value for the confidence level is 0.8.
\item CalculateCVScores: this method calculates the non conformitity scores (or probabilities) matrix from the cross-validation predictions of the input randomForest model (trained with k-fold cross-validation).
The non conformity scores matrix is stored in the field NonconformityScoresMatrix.
\item CalculatePValues: this method calculates the p.values for the datapoints in a external set.
The class predictions are stored in the field ClassPredictions,
whereas the p.values and their significance,
according to the user defined confidence level,
are stored in the field p.values.
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
\code{\link{ConformalRegression}}
}





\examples{
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

}
