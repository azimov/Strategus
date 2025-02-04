% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Settings.R
\name{createResultsExecutionSettings}
\alias{createResultsExecutionSettings}
\title{Create Results execution settings}
\usage{
createResultsExecutionSettings(
  resultsConnectionDetailsReference,
  resultsDatabaseSchema,
  workFolder,
  resultsFolder,
  minCellCount = 5
)
}
\arguments{
\item{resultsConnectionDetailsReference}{A string that can be used to retrieve the results database connection
details from a secure local store.}

\item{resultsDatabaseSchema}{A schema where the results tables are stored}

\item{workFolder}{A folder in the local file system where intermediate results can be written.}

\item{resultsFolder}{A folder in the local file system where the module output will be written.}

\item{minCellCount}{The minimum number of subjects contributing to a count before it can be included
in results.}
}
\value{
An object of type \code{ExecutionSettings}.
}
\description{
Create Results execution settings
}
