\name{spaceSimul}
\alias{spaceSimul}
\alias{oncoSimulIndiv}
\title{
  Simulation of tumor progression in space 1D 2D and 3D by demes.
}
\description{
  Simulates tumor progression in space with environment and genotypes restrictions. Demes are conglomerated cells whith probabilities of migration, birth and death.
  
  
  \code{save}.
}
\usage{
 oncoSimulIndiv (fp, model = "Exp", 
                numPassengers = 0, 
                mu = 1e-6, 
                muEF = NULL,
                detectionSize = 1e8, 
                detectionDrivers = 4,
                detectionProb = NA,
                sampleEvery = ifelse(model \%in\% c("Bozic", "Exp"), 1,
                             0.025),
                initSize = 500, s = 0.1, sh = -1,
                K = sum(initSize)/(exp(1) - 1), 
                keepEvery = sampleEvery,
                minDetectDrvCloneSz = "auto",
                extraTime = 0,
                finalTime = 0.25 * 25 * 365, 
                onlyCancer = FALSE,
                keepPhylog = FALSE,
                mutationPropGrowth = ifelse(model == "Bozic",
                                                       FALSE, TRUE),
                max.memory = 2000, 
                max.wall.time = 200,
                max.num.tries = 500,
                errorHitWallTime = TRUE,
                errorHitMaxTries = TRUE,
                verbosity = 0,
                initMutant = NULL,
                AND_DrvProbExit = FALSE,
                fixation = NULL,
                seed = NULL,
                interventions = NULL,
                userVars = NULL,
                rules = NULL)
  
  spaceSimul (dimension,
                maxSpace =,
                demePosition,
                initSize = 500,
                initMutant = Null?,
                initMutantSize,
                migrationProb,
                largeDistanceMigrationProb,
                mu = 1e-6,
                sampleEvery = ifelse(model %in% c("Bozic","Exp"), 1, 0.025). ,
                finalTime = 0.25 * 25 * 365, 
                maxDemes, 
                maxIterations, 
                model = "McFL", 
                spatialKeepEvery)

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
