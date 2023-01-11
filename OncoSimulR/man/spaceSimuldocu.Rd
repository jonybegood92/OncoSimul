\name{spaceSimul}
\alias{spaceSimul}
\alias{oncoSimulIndiv}
\title{
 Tumor progression and migration simulator in 1D, 2D and 3D.
}
\description{
 Simulates tumor progression by demes in space with environment and genotypes restrictions.
 Demes are conglomerated cells with migration, birth and death probabilities.


}
\usage{
 oncoSimulIndiv (fp,
                model = model,
                numPassengers = 0,
                mu = mu,
                muEF = NULL,
                detectionSize = 1e8,
                detectionDrivers = 4,
                detectionProb = NA,
                sampleEvery = sampleEvery,
                initSize = initSize,
                K = sum(initSize)/(exp(1) - 1),
                keepEvery = sampleEvery,
                minDetectDrvCloneSz = "auto",
                extraTime = 0,
                finalTime = finalTime,
                onlyCancer = FALSE,
                keepPhylog = FALSE,
                mutationPropGrowth = ifelse(model == "Bozic", FALSE, TRUE),
                max.memory = 2000,
                max.wall.time = 200,
                max.num.tries = 500,
                errorHitWallTime = TRUE,
                errorHitMaxTries = TRUE,
                verbosity = verbosity,
                initMutant = initMutant,
                AND_DrvProbExit = FALSE,
                fixation = NULL,
                seed = NULL,
                interventions = NULL,
                userVars = NULL,
                rules = NULL)


  spaceSimul (dimension,
                # maxSpace,
                # demePosition,
                # demesComposition,
                # largeDistanceMigrationProb,
                migrationProb = 0.1,
                maxDemes = -1,
                maxIterations = -1,
                keepDemeSimul = FALSE,
                spatialKeepEvery = 1,
                fitness,
                verbosity = 0
                model = "McFL",
                K = sum(initSize)/(exp(1) - 1),
                initSize = 500,
                initMutant = Null,
                mu = 1e-6,
                sampleEvery = ifelse(model %in% c("Bozic","Exp"), 1, 0.025),
                finalTime = 0.25 * 25 * 365,
                )

}
\arguments{

\item{dimension}{
    Dimensions 1D, 2D and 3D. It must be added.
   Only numbers between 1-3 accepted

   }

\item{maxSpace}{
    Maximum number of space that the simulation can be created (futher development).

   }

\item{demeposition}{
    It gives the option with one or more demes to start in
    random space. (futher development)

   }

\item{demesComposition}{
    A list of lists with iniMutant and initSize of each deme (futher development)
   }

\item{largeDistanceMigrationProb}{

     Deme Migration probability to random spaces (further development)

   }

\item{migrationProb}{
    Deme Migration probability to nearby spaces. This must be a value between 0 to 1.
   Default = 0.1

   }


\item{maxDemes}{

    Maximum number of demes that the simulation can create. default = -1. This is a number given to stop the simulation
   for higher numbers, higher requirements needed. Only numbers higher than 0 permited,

  }

\item{maxIterations}{

    Maximum number of iterations that the simulation can make.
   it is recomended to check this before running the simulation.
   default = -1

  }

\item{spatialKeepEvery}{

    Number of iterations needed to save the values. default = 1

  }

\item{KeepDemeSimul}{

    It keeps the saved information done by the simulation in the memory. default = FALSE
  }

\item{verbosity}{
    If 0, run silently. Iincreasing values of verbosity
  provide progressively more information about intermediate steps,
  possible numerical notes/warnings from the C++ code, etc. Values less
  than 0 supress some default notes: use with care.

  }

\item{fitness}{

     It is the same value of fp in oncoSimulInviv. Either a poset that specifies the order restrictions (see
    \code{\link{poset}} if you want to use the specification as in
    v.1. Otherwise, a fitnessEffects object (see
    \code{\link{allFitnessEffects}}). You must always use a fitnessEffects object
    when you are in a frequency dependent fitness simulation; of course in this case
    fp$frequencyDependentFitness must be TRUE.

    Other arguments below (s, sh, numPassengers) make sense only if you
    use a poset, as they are included in the fitnessEffects object.

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
   default = sum(initSize)/(exp(1) - 1).

  }

\item{initSize}{
    Initial population size. default = 500. If you are passing more than one
    \code{initMutant}, the initial population sizes of each
    clone/species/genotype, given in the same order as in the
    \code{initMutant} vector. \code{initMutant} thus allows to start the
    simulation from arbitrary population compositions. Combined with
    \code{mu} it allows for multispecies simulations (see the vignette for
    examples).
  }

\item{initMutant}{

     For v.2: a string with the mutations of the initial
    mutant, if any. default = null
    This is the same format as for \code{\link{evalGenotype}}.
    The default (if you pass nothing) is to
    start the simulation from the wildtype genotype with nothing mutated.
    For v.1 we no longer accept initMutant: it will be ignored.

    (\code{evalGenotype} also accepts the genotype as a numeric vector;
    \code{initMutant} must be a character string.)
  }

\item{mu}{
     Mutation rate. default = 1e-6. Can be a single value or a named vector. If a single
    value, all genes will have the same mutation rate. If a named vector,
    the entries in the vector specify the gene-specific mutation rate. If
    you pass a vector, it must be named, and it must have entries for all
    the genes in the fitness specification. Passing a vector is only
    available when using fitnessEffects objects for fitness specification.
    Mutation rates \code{<10^-20} are not accepted.
    See also \code{mutationPropGrowth}.
  }

\item{sampleEvery}{

     How often the whole population is sampled. default = ifelse(model %in% c("Bozic","Exp"), 1, 0.025).
    This is not the same as the
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
    run. default = 0.25 * 25 * 365. Set to NA to disable this limit.

  }
}

\details{

 The basic program used is OncoSimulIndiv from:
 https://github.com/rdiaz02/OncoSimul
 We basically added some tools after OncoSimulIndiv proces to simulate
 the movement in space of the tumour created. We followed some ideas
 about how tumor progresion will occur and implemented in the algorithm.
 The probability of tomour progresion will be added by the usser, this
 gives a tool to the scientists to simulate the process by their own parameters.

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

  Total number of cells in the simulation. This will be part of a data frame stored while the simulation is runing. ??

  }

\item{NumIter }{

  Number of iterations done. This will

  }


\item{NumDemes }{
  Number of demes created by the simulation
  }

\item{TimeForIter }{
  How long each iteration took to be created.
  }

  For \code{oncoSimulIndiv} a list, of class "oncosimul", with the
  following components:

\item{pops.by.time }{
   A matrix of the population sizes of the clones,
  with clones in columns and time in row. Not all clones are shown here,
  only those that were present in at least on of the keepEvery samples.}

\item{NumClones   }{

   Total number of clones in the above matrix. This
  is not the total number of distinct clones that have appeared over all
  simulations (which is likely to be larger or much larger).}

\item{TotalPopSize}{ Total population size at the end of simulation.
}
\item{Genotypes}{
     A matrix of genotypes. For each of the clones in the
    pops.by.time matrix, its genotype, with a 0 if the gene is not
    mutated and a 1 if it is mutated.}


\item{MaxNumDrivers}{ The largest number of mutated driver genes ever
    seen in the simulation in any clone.}

\item{MaxDriversLast}{ The largest number of mutated drivers in any
    clone     at the   end of the simulation.}

\item{NumDriversLargestPop}{ The number of mutated driver genes in the
    clone with largest population size. }

\item{LargestClone}{ Population size of the clone with largest number
    of population size.}

\item{PropLargestPopLast}{ Ratio of LargestClone/TotalPopSize}

\item{FinalTime}{ The time (in time units) at the end of the
    simulation.}

\item{NumIter}{ The number of iterations of the BNB algorithm.}

\item{HittedWallTime}{ TRUE if we reached the limit of max.wall.time. FALSE
    otherwise.}

\item{TotalPresentDrivers}{
     The total number of mutated driver genes,
    whether or not in the same clone. The number of elements in
    \code{OccurringDrivers}, below.}

\item{CountByDriver}{
     A vector of length number of drivers, with the
    count of the number of clones that have that driver mutated.}

\item{OccurringDrivers}{ The actual number of drivers mutated.}

\item{PerSampleStats}{
     A 5 column matrix with a row for each sampling
    period. The columns are: total population size, population size of the
    largest clone, the ratio of the two, the largest number of drivers in
    any clone, and the number of drivers in the clone with the largest
    population size.}

\item{other}{

     A list that contains statistics for an estimate of the
    simulation error when using the McFarland model as well as other
    statistics. For the McFarland model, the relevant value is errorMF,
    which is -99 unless in the McFarland model. For the McFarland model it
    is the largest difference of successive death rates. The entries named
    minDMratio and minBMratio are the smallest ratio, over all
    simulations, of death rate to mutation rate and birth rate to mutation
    rate, respectively. The BNB algorithm thrives when those are large.
}
}


\references{
 \url{https://posgrado.uam.es/pluginfile.php/1710132/mod_resource/content/1/TFM_Alberto_Parramon.pdf}
 \url{https://github.com/rdiaz02/OncoSimul}

}

\author{
Jose Maria Casanova,
Darío González Menéndez,
Eduardo Diego Lozano,
Jonathan Rodríguez

}
\examples{
## save all data
save(list = ls(), file= "spaceSimul.RData")

## restore the saved values to the current environment
load("spaceSimul.RData")

## restore the saved values to the workspace
load("spaceSimul.RData", .GlobalEnv)
}
