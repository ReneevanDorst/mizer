% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/setSearchVolume.R
\name{setSearchVolume}
\alias{setSearchVolume}
\alias{getSearchVolume}
\title{Set search volume}
\usage{
setSearchVolume(params, search_vol = NULL, ...)

getSearchVolume(params)
}
\arguments{
\item{params}{MizerParams}

\item{search_vol}{Optional. An array (species x size) holding the search volume
for each species at size. If not supplied, a default is set as described in
the section "Setting search volume".}

\item{...}{Unused}
}
\value{
MizerParams with updated search volume. Because of the way the R
language works, \code{setSearchVolume()} does not make the changes to the params
object that you pass to it but instead returns a new params object. So to
affect the change you call the function in the form
\code{params <- setSearchVolume(params, ...)}.
}
\description{
Set search volume
}
\section{Setting search volume}{

The search volume \eqn{\gamma_i(w)} of an individual of species \eqn{i}
and weight \eqn{w} multiplies the predation kernel when
calculating the encounter rate in \code{\link[=getEncounter]{getEncounter()}} and the
predation rate in \code{\link[=getPredRate]{getPredRate()}}.

The name "search volume" is a bit misleading, because \eqn{\gamma_i(w)} does
not have units of volume. It is simply a parameter that determines the rate
of predation. Its units depend on your choice, see section "Units in mizer".
If you have chose to work with total abundances, then it is a rate with units
1/year. If you have chosen to work with abundances per m^2 then it has units
of m^2/year. If you have chosen to work with abundances per m^3 then it has
units of m^3/year.

If the \code{search_vol} argument is not supplied, then the search volume is
set to
\deqn{\gamma_i(w) = \gamma_i w^q_i.}
The values of \eqn{\gamma_i} (the search volume at 1g) and \eqn{q_i} (the
allometric exponent of the search volume) are taken from the \code{gamma} and
\code{q} columns in the species parameter dataframe. If the \code{gamma}
column is not supplied in the species parameter dataframe, a default is
calculated by the \code{\link[=get_gamma_default]{get_gamma_default()}} function. Note that only
for predators of size \eqn{w = 1} gram is the value of the species parameter
\eqn{\gamma_i} the same as the value of the search volume \eqn{\gamma_i(w)}.
}

\examples{
\dontrun{
params <- newTraitParams()
params@species_params$gamma[3] <- 1000
params <- setSearchVolume(params)
}
}
\seealso{
Other functions for setting parameters: 
\code{\link{setExtMort}()},
\code{\link{setFishing}()},
\code{\link{setInitialValues}()},
\code{\link{setInteraction}()},
\code{\link{setMaxIntakeRate}()},
\code{\link{setMetabolicRate}()},
\code{\link{setPredKernel}()},
\code{\link{setReproduction}()},
\code{\link{setResource}()},
\code{\link{species_params}()}
}
\concept{functions for setting parameters}
