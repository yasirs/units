% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/arith.R
\name{Ops.units}
\alias{Ops.units}
\title{Title}
\usage{
\method{Ops}{units}(e1, e2)
}
\arguments{
\item{e1}{object of class \code{units}, or something that can be coerced to it by \code{as.units(e1)}}

\item{e2}{object of class \code{units}, or something that can be coerced to it by \code{as.units(e2)}}
}
\value{
object of class \code{units}
}
\description{
Title
}
\examples{
a = as.units(1:3, "m/s")
b = as.units(1:3, "m/s")
a + b
}
