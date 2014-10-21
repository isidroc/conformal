\name{expGrid}
\alias{expGrid}
\title{Exponential Grid Definition
}
\description{
	The function defines an exponential series,
	which can be used, e.g. when defining the parameter space when training some models
	such as Support Vector Machines or Gaussian Processes.
}
\usage{
expGrid(power.from, power.to, power.by, base)
}
\arguments{
  \item{power.from}{
	  The starting exponential of the series.
}
  \item{power.to}{
	  The latest exponential of the series.
}
  \item{power.by}{
	  The exponential step of the series.
}
  \item{base}{
	  The base of the exponential series.
}
}
\value{
	A vector with the exponential series.
}

\author{
Isidro Cortes <isidrolauscher@gmail.com> 
}

\examples{
expGrid(power.from=-10,power.to=10,power.by=2,base=10)
}

