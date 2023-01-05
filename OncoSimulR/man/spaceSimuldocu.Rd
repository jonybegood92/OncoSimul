\name{spaceSimul}
\alias{oncoSimulIndiv}
\title{
  Simulation of tumor progression in space 1D 2D and 3D by demes.
}
\description{
  Simulates tumor progression in space with environment and genotypes restrictions. Demes are conglomerated cells whith probabilities of migration, birth and death.
  
  
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
save(list = ls(), file= "spaceSimul.RData")

## restore the saved values to the current environment
load("spaceSimul.RData")

## restore the saved values to the workspace
load("spaceSimul.RData", .GlobalEnv)
}
