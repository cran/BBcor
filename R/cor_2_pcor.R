#' Correlation to Partial Correlation
#' 
#' @description Convert correlations into the corresponding partial correlations.
#' 
#' @param x An object of class \code{bbcor}
#' @param ... Currently ignored
#'
#' \itemize{
#' \item \code{pcor_mean}: A matrix including the posterior mean.
#' 
#' \item \code{samps}: An array of dimensions \code{p} by \code{b} by \code{iter} that includes the 
#' sampled partial correlation matrices.
#' }
#' 
#' @examples
#' Y <- mtcars[,1:3]
#' 
#' fit <- bbcor(Y, method = "spearman")
#' 
#' cor_2_pcor(fit)
#' 
#' @export
cor_2_pcor <- function(x,...){
  
  # variables
  p <- ncol(x$cor_mean)
  
  # posterior samples
  iter <- x$iter
  
  # convert to pcors
  samps <- array(
    sapply(1:iter, function(s)
      - cov2cor(solve(x$samps[, , s])) + diag(2, p),
      simplify = TRUE),
    c( p, p, iter)
    )
  
  # pcor means
  pcor_mean <- apply(samps, 1:2, mean)
  
  # returned object
  returned_object <- list(pcor_mean = pcor_mean, 
                          samps = samps, 
                          iter = x$iter, 
                          Y = x$Y)
  
  # assing class
  class(returned_object) <- c("bbcor", 
                              "cor_2_pcor")
  return(returned_object)
}



