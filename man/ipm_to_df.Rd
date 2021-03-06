% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-export.R
\name{ipm_to_df}
\alias{ipm_to_df}
\alias{ipm_to_df.array}
\alias{ipm_to_df.default}
\title{Convert ipmr matrix to long data frame}
\usage{
ipm_to_df(ipm, ...)

\method{ipm_to_df}{array}(ipm, ...)

\method{ipm_to_df}{default}(ipm, ..., mega_mat, name_ps = NULL, f_forms = NULL)
}
\arguments{
\item{ipm}{Output from \code{make_ipm}.}

\item{...}{Other arguments passed to methods.}

\item{mega_mat}{A vector with symbols, I's, and/or 0s representing the matrix blocks.
They should be specified in ROW MAJOR order! Can also be a character
string specifying the call. Hierarchical syntax is supported. When used,
\code{format_mega_matrix} will produce as many mega-matrices as there are
combinations of \code{levels_hier_effs} in the \code{proto_ipm}.}

\item{name_ps}{The prefix(es) for the kernel name that correspond to survival
and growth/maturation of existing individuals. For the model
\code{K = P_age + F_age}, this would be \code{"P"}. Only applies to
age X size models. The \code{"_age"} suffix is appended automatically, so
does not need to be supplied.}

\item{f_forms}{The names of the kernels that correspond to production of new
individuals, and possibly, how they are combined. For example, a model that
includes sexual (with an "F" kernel) and asexual reproduction (with a "C" kernel),
this would be \code{"F + C"}. If data come from multiple sites or years,
then this information is supplied using the suffix syntax (i.e.
\code{f_forms = "F_yr + C_yr"}). Only applies to age X size models. The
\code{"_age"} suffix is appended automatically, so does not need to be
supplied.}
}
\value{
A data frame with 3 columns named \code{"t"}, \code{"t_1"}, and
\code{"value"}.
}
\description{
Converts IPM kernels into long data frames. These are useful for
creating plots using \code{ggplot2}.
}
\examples{

data(gen_di_det_ex)

big_mat_df <- ipm_to_df(gen_di_det_ex,
                        mega_mat = c(stay_discrete, go_discrete,
                                     leave_discrete, P))

}
