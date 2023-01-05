\name{spaceSimul}
\alias{oncoSimulIndiv}
\title{
  Simulation of tumor progression in space 1D 2D and 3D by demes.
}
\description{
  Simulates tumor progression in space with environment and genotypes restriction. Demes are conglomerated cells whith probabilities of migration, death and expansion.
  
  
  \code{save}.
}

\arguments{
  \item{file}{a connection or a character string giving the
    name of the file to load.}
  \item{envir}{the environment where the data should be
    loaded.}
}
}
\examples{
## save all data
save(list = ls(), file= "all.RData")

## restore the saved values to the current environment
load("all.RData")

## restore the saved values to the workspace
load("all.RData", .GlobalEnv)
}
\keyword{file}
