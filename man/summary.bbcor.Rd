% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R
\name{summary.bbcor}
\alias{summary.bbcor}
\title{Summarize posterior samples from bbcor object}
\usage{
\method{summary}{bbcor}(object, ci = 0.9, decimals = 2, ...)
}
\arguments{
\item{object}{An object of class \code{bbcor}}

\item{ci}{The desired credible interval}

\item{decimals}{The number of decimals points to which estimates should be rounded}

\item{...}{Currently ignored}
}
\value{
A \code{data.frame} summarizing the relations
}
\description{
Summarize posterior samples from bbcor object
}
\examples{

Y <- mtcars[, 1:5]
bb <- bbcor(Y, method = "spearman")

summary(bb)
}
