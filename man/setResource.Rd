% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/setResource.R
\name{setResource}
\alias{setResource}
\alias{getResourceRate}
\alias{getResourceCapacity}
\alias{getResourceDynamics}
\alias{resource_params}
\alias{resource_params<-}
\title{Set up resource}
\usage{
setResource(
  params,
  r_resource = NULL,
  K_resource = NULL,
  r_pp = resource_params(params)[["r_pp"]],
  kappa = resource_params(params)[["kappa"]],
  lambda = resource_params(params)[["lambda"]],
  n = resource_params(params)[["n"]],
  w_pp_cutoff = resource_params(params)[["w_pp_cutoff"]],
  resource_dynamics = NULL,
  ...
)

getResourceRate(params)

getResourceCapacity(params)

getResourceDynamics(params)

resource_params(params)

resource_params(params) <- value
}
\arguments{
\item{params}{A MizerParams object}

\item{r_resource}{Optional. Vector of resource intrinsic birth rates}

\item{K_resource}{Optional. Vector of resource intrinsic carrying capacity}

\item{r_pp}{Coefficient of the intrinsic resource birth rate}

\item{kappa}{Coefficient of the intrinsic resource carrying capacity}

\item{lambda}{Scaling exponent of the intrinsic resource carrying capacity}

\item{n}{Allometric growth exponent for resource}

\item{w_pp_cutoff}{The upper cut off size of the resource spectrum.
Default is 10 g.}

\item{resource_dynamics}{Function that determines resource dynamics by
calculating the resource spectrum at the next time step from the current
state.}

\item{...}{Unused}

\item{value}{List of resource parameters}
}
\value{
A MizerParams object with updated resource parameters. Because of the
way the R language works, \code{setResource()} does not make the changes to the
params object that you pass to it but instead returns a new params object.
So to affect the change you call the function in the form
\code{params <- setResource(params, ...)}.
}
\description{
Sets the intrinsic resource growth rate and the intrinsic resource carrying
capacity as well as the name of the function used to simulate the resource
dynamics
}
\section{Setting resource dynamics}{

By default, mizer uses a semichemostat model to describe the resource
dynamics in each size class independently. This semichemostat dynamics is implemented
by the function \code{\link[=resource_semichemostat]{resource_semichemostat()}}. You can change the
resource dynamics by writing your own function, modelled on
\code{\link[=resource_semichemostat]{resource_semichemostat()}}, and then passing the name of your
function in the \code{resource_dynamics} argument.

The \code{r_resource} argument is a vector specifying the intrinsic resource
growth rate for each size class. If it is not supplied, then the intrinsic growth
rate \eqn{r_p(w)} at size \eqn{w}
is set to \deqn{r_p(w) = r_p\, w^{n-1}.}{r_p(w) = r_p w^{n-1}}
The values of \eqn{r_p} and \eqn{n} are taken from the \code{r_resource}
and \code{n} arguments.

The \code{K_resource} argument is a vector specifying the intrinsic resource
carrying capacity for each size class. If it is not supplied, then the
intrinsic carrying capacity \eqn{c_p(w)} at size \eqn{w}
is set to \deqn{c_p(w) = \kappa\, w^{-\lambda}}{c_p(w) = \kappa w^{-\lambda}}
for all \eqn{w} less than \code{w_pp_cutoff} and zero for larger sizes.
The values of \eqn{\kappa} and \eqn{\lambda} are taken from the \code{kappa}
and \code{lambda} arguments.
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
\code{\link{setSearchVolume}()},
\code{\link{species_params}()}
}
\concept{functions for setting parameters}
