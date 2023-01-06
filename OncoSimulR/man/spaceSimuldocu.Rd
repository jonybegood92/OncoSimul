\name{spaceSimul}
\alias{spaceSimul}
\alias{oncoSimulIndiv}
\title{
 Tumor progression and migration simulator in 1D, 2D and 3D
}
\description{
  Simulates tumor progression in space with environment and genotypes restrictions. Demes are conglomerated cells with migration, birth and death probabilities.
  
  
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
                initMutantSize,
                migrationProb,
                largeDistanceMigrationProb,
                maxDemes, 
                maxIterations,
                spatialKeepEvery,
                fitnessEffects ,
                model = "McFL",
                K = sum(initSize)/(exp(1) - 1), 
                initSize = 500,
                initMutant = Null?,
                mu = 1e-6,
                sampleEvery = ifelse(model %in% c("Bozic","Exp"), 1, 0.025). ,
                finalTime = 0.25 * 25 * 365,   
                )

}
\arguments{

  \item{dimension}{
    Dimensions 1D, 2D and 3D.
    
   }
  
  \item{maxSpace}{
    Maximum number of space that the simulation can be created futher development.
    
   }
  
  \item{demeposition}{
    This is in develepment. It gives the option tu start with several Demes in 
    random space.
    
   }
  
  \item{initMutantSize}{
    
    
   }
  
  \item{migrationProb}{
    Deme Migration probability to nearby spaces 
   }   
  
  \item{largeDistanceMigrationProb}{
    Deme Migration probability to random spaces (further development)
   }    
  
  \item{maxDemes}{
    
    Maximum number of demes that the simulation can create.   
  
  }    
  
  \item{maxIterations}{
    
    Maximum number of iterations that the simulation can make   
  
  }  
  
  \item{spatialKeepEvery}{
    
   How many iterations are saved per simulation.
  
  }  
  \item{model}{ default model "McFarlandLog", "McFarlandLogD"
    (the last two can be abbreviated to "McFL" and "McFLD",
    respectively). (See vignette for the difference
    between "McFL" and "McFLD": in the former, death rate = \eqn{\log(1 +
    N/K)} where \eqn{K} is the initial equilibrium population size; when
    using "McFLD", death rate = \eqn{\max(1, \log(1 + N/K))}, so that death
    rate never goes below 1.).

  }    

  \item{K}{
    Initial population equilibrium size in the McFarland models.

  }

  \item{initSize}{
    Initial population size. If you are passing more than one
    \code{initMutant}, the initial population sizes of each
    clone/species/genotype, given in the same order as in the
    \code{initMutant} vector. \code{initMutant} thus allows to start the
    simulation from arbitrary population compositions. Combined with
    \code{mu} it allows for multispecies simulations (see the vignette for
    examples).
  }

   \item{initMutant}{For v.2: a string with the mutations of the initial
    mutant, if any. This is the same format as for
    \code{\link{evalGenotype}}. The default (if you pass nothing) is to
    start the simulation from the wildtype genotype with nothing mutated.
    For v.1 we no longer accept initMutant: it will be ignored.

    (\code{evalGenotype} also accepts the genotype as a numeric vector;
    \code{initMutant} must be a character string.)
  }


  \item{mu}{
    Mutation rate. Can be a single value or a named vector. If a single
    value, all genes will have the same mutation rate. If a named vector,
    the entries in the vector specify the gene-specific mutation rate. If
    you pass a vector, it must be named, and it must have entries for all
    the genes in the fitness specification. Passing a vector is only
    available when using fitnessEffects objects for fitness specification.
    Mutation rates \code{<10^-20} are not accepted.
    See also \code{mutationPropGrowth}. 
  }

  \item{sampleEvery}{

    How often the whole population is sampled. This is not the same as the
    interval between successive samples that are kept or stored (for that,
    see \code{keepEvery}).

    For very fast growing clones, you might need to have a small value
    here to minimize possible numerical problems (such as huge increase in
    population size between two successive samples that can then lead to
    problems for random number generators). Likewise, for models with
    density dependence (such as McF) this value should be very small.

  }

  \item{finalTime}{
    What is the maximum number of time units that the simulation can
    run. Set to NA to disable this limit.

  }
}
                                                  
\value{

  For \code{spaceSimul} a list, of class "spaceSimul", with the
  following components:  
  
 
  \item{SpatialSummary }{ dataframe with the following rows: 
                         Genotypes (lsit of Genotypes), 
                         Population (Cell population of each genotype ), 
                         Demes (Genotypes of each deme), 
                         WinDemes (Largest genotype in each deme)
                        }
  
  \item{TotalPopulation }{
  Total number of cells in the simulation.
  }
  
  \item{NumIter }{
  Number of iterations done.
  }
  
  \item{NumDemes }{
  Number of demes created by the simulation
  }
  
  \item{TimeForIter }{
  How long each iteration took to be created.
  }
  
  For \code{oncoSimulIndiv} a list, of class "oncosimul", with the
  following components:
  
    \item{pops.by.time }{A matrix of the population sizes of the clones,
    with clones in columns and time in row. Not all clones are shown here,
    only those that were present in at least on of the keepEvery samples.}
  
  \item{NumClones   }{Total number of clones in the above matrix. This
  is not the total number of distinct clones that have appeared over all
  simulations (which is likely to be larger or much larger).}

  \item{TotalPopSize}{Total population size at the end.}

  \item{Genotypes}{A matrix of genotypes. For each of the clones in the
    pops.by.time matrix, its genotype, with a 0 if the gene is not
    mutated and a 1 if it is mutated.}

  
  \item{MaxNumDrivers}{The largest number of mutated driver genes ever
    seen in the simulation in any clone.}

  \item{MaxDriversLast}{The largest number of mutated drivers in any
    clone     at the   end of the simulation.}

  \item{NumDriversLargestPop}{The number of mutated driver genes in the
    clone with largest population size. }

  \item{LargestClone}{Population size of the clone with largest number
    of population size.}

  \item{PropLargestPopLast}{Ratio of LargestClone/TotalPopSize}

  \item{FinalTime}{The time (in time units) at the end of the
    simulation.}

  \item{NumIter}{The number of iterations of the BNB algorithm.}

  \item{HittedWallTime}{TRUE if we reached the limit of max.wall.time. FALSE
    otherwise.}

  \item{TotalPresentDrivers}{The total number of mutated driver genes,
    whether or not in the same clone. The number of elements in
    \code{OccurringDrivers}, below.}

  \item{CountByDriver}{A vector of length number of drivers, with the
    count of the number of clones that have that driver mutated.}

  \item{OccurringDrivers}{The actual number of drivers mutated.}

  \item{PerSampleStats}{A 5 column matrix with a row for each sampling
    period. The columns are: total population size, population size of the
    largest clone, the ratio of the two, the largest number of drivers in
    any clone, and the number of drivers in the clone with the largest
    population size.}
  
  \item{other}{A list that contains statistics for an estimate of the
    simulation error when using the McFarland model as well as other
    statistics. For the McFarland model, the relevant value is errorMF,
    which is -99 unless in the McFarland model. For the McFarland model it
    is the largest difference of successive death rates. The entries named
    minDMratio and minBMratio are the smallest ratio, over all
    simulations, of death rate to mutation rate and birth rate to mutation
    rate, respectively. The BNB algorithm thrives when those are large.
}                                        


\examples{
## save all data
save(list = ls(), file= "spaceSimul.RData")

## restore the saved values to the current environment
load("spaceSimul.RData")

## restore the saved values to the workspace
load("spaceSimul.RData", .GlobalEnv)
}
