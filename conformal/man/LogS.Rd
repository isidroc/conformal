\name{LogS}
\alias{LogS}
\docType{data}
\title{Small Molecule Solubility (LogS) Data}
\description{
	Aqueous solubility datas for 1,606 small molecules. PaDEL descriptors have been computed for these molecules.
	The data has been split into a training (70\%) and a test (30\%) set.
}
\details{
This dataset comprises the aqueous solubility (S) values at a temperature of 20-25 Celsius degrees in mol/L, expressed as logS, for 1,708 small molecules
reported by Wang et al.
Compound structures were standardized with the function StandardiseMolecules from the R package camb
using the default parameters:
(i) all molecules were kept irrespective of the numbers of fluorines, iodines, chlorine, and bromines
present in their strucuture, or (ii) of their molecular mass.
905 one-dimensional topological and
physicochemical descriptors were calculated with the function GeneratePadelDescriptors from the R package camb
which invokes the PaDEL-Descriptor Java library.
Near zero variance and highly-correlated descriptors 
were removed with the functions
(i) RemoveNearZeroVarianceFeatures (cut-off value of 30/1), and
(ii) RemoveHighlyCorrelatedFeatures (cut-off value of 0.95) 
After applying these steps the dataset consists of 1,606 molecules encoded with 211 descriptors.


Using data(LogS) exposes 4 objects: 

(i) LogSDescsTrain is a data frame with PaDEL descriptors for the datapoints in the training set (70\% of the data).
(ii) LogSTrain is a numeric vector containing the data solubility values for the datapoints in the training set.
(iii) LogSDescsTest is a data frame with PaDEL descriptors for the datapoints in the test set (30\% of the data).
(iv) LogSTest is a numeric vector containing the data solubility values for the datapoints in the test set.

}
\references{
Wang et al. J. Chem. Inf. Model., 2007, 47 (4), pp 1395-1404
DOI: 10.1021/ci700096r
\url{http://pubs.acs.org/doi/abs/10.1021/ci700096r}
}
\examples{
# To use the data
data(LogS)
}
