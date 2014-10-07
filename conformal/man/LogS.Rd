\name{LogS}
\alias{LogS}
\docType{data}
\title{Small Molecule Solubility (LogS) Data}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data(LogS)}
\format{

}
\details{

 describe these data: ``Bakken and Jurs studied a set of compounds originally discussed by Klopman et al., who were interested in multidrug resistance reversal (MDRR) agents. The original response variable is a ratio measuring the ability of a compound to reverse a leukemia cell's resistance to adriamycin. However, the problem was treated as a classification problem, and compounds with the ratio >4.2 were considered active, and those with the ratio <= 2.0 were considered inactive. Compounds with the ratio between these two cutoffs were called moderate and removed from the data for two class classification, leaving a set of 528 compounds (298 actives and 230 inactives). (Various other arrangements of these data were examined by Bakken and Jurs, but we will focus on this particular one.) We did not have access to the original descriptors, but we generated a set of 342 descriptors of three different types that should be similar to the original descriptors, using the DRAGON software.'' The data and R code are in the Supplemental Data file for the article.

Using data(LogS) exposes 4 objects: 

(i) mdrrDescr is a data frame with the descriptor data and {mdrrClass} is a factor vector with the activity results.

}
\source{
}
\references{
	\href{http://pubs.acs.org/doi/abs/10.1021/ci700096r}{Wang et al (2007)}
}
\examples{
data(LogS)
## maybe str(LogS) ; plot(LogS) ...
}
\keyword{datasets}
