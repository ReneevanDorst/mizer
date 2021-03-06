% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wrapper_functions.R
\name{setRmax}
\alias{setRmax}
\title{Set maximum reproduction rate}
\usage{
setRmax(params, rfac)
}
\arguments{
\item{params}{A MizerParams object}

\item{rfac}{The factor by which the maximum reproduction rate should be higher than
the initial-state reproduction rate}
}
\value{
A MizerParams object
}
\description{
Takes a MizerParams object with density-independent reproduction rate and
sets a Beverton-Holt density-dependence with a maximum reproduction rate that
is a chosen factor \code{rfac} higher than the initial-state reproduction
rate.
}
