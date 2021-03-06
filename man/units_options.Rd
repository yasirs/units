% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/options.R
\name{units_options}
\alias{units_options}
\title{set one or more units global options}
\usage{
units_options(..., sep, group, negative_power, parse, set_units_mode,
  auto_convert_names_to_symbols, simplify, allow_mixed, unitless_symbol)
}
\arguments{
\item{...}{named options (character) for which the value is queried}

\item{sep}{character length two; default \code{c("~", "~")}; space separator between variable and units, and space separator between two different units}

\item{group}{character length two; start and end group, may be two empty strings, a parenthesis pair, or square brackets; default: square brackets.}

\item{negative_power}{logical, default \code{FALSE}; should denominators have negative power, or follow a division symbol?}

\item{parse}{logical, default \code{TRUE}; should the units be made into an expression (so we get subscripts)? Setting to \code{FALSE} may be useful if \link{parse} fails, e.g. if the unit contains symbols that assume a particular encoding}

\item{set_units_mode}{character; either \code{"symbols"} or \code{"standard"}; see \link{set_units}; default is \code{"symbols"}}

\item{auto_convert_names_to_symbols}{logical, default \code{TRUE}: should names, such as \code{degree_C} be converted to their usual symbol?}

\item{simplify}{logical, default \code{NA}; simplify units in expressions?}

\item{allow_mixed}{logical; if \code{TRUE}, combining mixed units creates a \code{mixed_units} object, if \code{FALSE} it generates an error}

\item{unitless_symbol}{character; set the symbol to use for unitless (1) units}
}
\value{
in case options are set, invisibly a named list with the option values that are being set; if an option is queried, the current option value.
}
\description{
set units global options, mostly related how units are printed and plotted
}
\details{
This sets or gets units options. Set them by using named arguments, get them by passing the option name.

The default \code{NA} value for \code{simplify} means units are not simplified in \link{set_units} or \link{as_units}, but are simplified in arithmetical expressions.
}
\examples{
old = units_options(sep = c("~~~", "~"), group = c("", "")) # more space, parenthesis
old
## set back to defaults:
units_options(sep = c("~", "~"), group = c("[", "]"), negative_power = FALSE, parse = TRUE)
units_options("group")
}
