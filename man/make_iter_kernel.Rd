% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils-export.R
\name{format_mega_matrix}
\alias{format_mega_matrix}
\alias{format_mega_matrix.default}
\alias{format_mega_matrix.age_x_size_ipm}
\alias{make_iter_kernel}
\title{Create iteration kernels from an IPM object}
\usage{
format_mega_matrix(ipm, ...)

\method{format_mega_matrix}{default}(ipm, mega_mat, ...)

\method{format_mega_matrix}{age_x_size_ipm}(ipm, name_ps, f_forms, ...)

make_iter_kernel(ipm, mega_mat = NULL, name_ps = NULL, f_forms = NULL)
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
A list containing a large matrix or many large matrices (when used with
hierarchical syntax). The names in the former case will be \code{"mega_matrix"}
and in the latter case, \code{"mega_matrix_<hier_effs>"} with the levels of the
hierarchical effects substituted in.
}
\description{
Creates iteration kernels for IPMs. \code{ipmr} does not create
these to iterate models, but they may be useful for further analyses.
}
\details{
\code{ipmr} does not generate complete iteration kernels, and uses
sub-kernels to iterate models. However, some further analyses are just easier
to code with a complete iteration kernel. This handles constructing those for
simple and general models of all forms. \code{format_mega_matrix} is used
internally by \code{make_iter_kernel} for general IPMs.

\code{I} and \code{0} represent identity matrices and 0 matrices,
respectively. They can be used to fill in blocks that represent either, without
having to create those separately and append them to the model object. The function
will work out the correct dimensions for both internally, and there is no
restriction on the number that may be used in a given call.

For \code{age_size_ipm}s, the correct form of \code{mega_mat} is generated
internally by creating sub-diagonal matrices for the \code{name_ps} kernels,
and a top row using the \code{f_forms}. If hierarchical effects are part of the
model, the suffixes should be attached to the \code{name_ps, f_forms} in the
function arguments, and the correct block matrices will be generated internally.
}
\examples{
data(gen_di_det_ex)

big_k <- make_iter_kernel(gen_di_det_ex,
                            mega_mat = c(0, go_discrete,
                                         leave_discrete, P))

char_call <- c(0, "go_discrete", "leave_discrete", "P")

big_k_c <- make_iter_kernel(gen_di_det_ex, mega_mat = char_call)

# Now, with an Identity matrix instead of a 0

big_k <- make_iter_kernel(gen_di_det_ex,
                            mega_mat = c(I, go_discrete,
                                         leave_discrete, P))

# For simple IPMs with no hierarchical effects, this computes the sum of
# the sub-kernels (i.e. K = P + F)

data(sim_di_det_ex)

simple_k <- make_iter_kernel(sim_di_det_ex)

}
