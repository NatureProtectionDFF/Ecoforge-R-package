#' @export
transectSample <-
function(sites, occ, tlen, drng, angle="random") {
    hl <- tlen/2
    ns <- nrow(sites)
    # rect reference matrix
    cm <- matrix(c(rep(-hl, 3), rep(hl, 3), 
                   drng, 0, -drng, -drng, 0, drng), 6)

    if (angle == "random") {
        # random angle for each transect
        angle <- runif(ns, 0, 2*pi)
    } else if (length(angle) < nrow(sites)) {
        stop("Angle vector must have same length as number of locations in 'pos'")
    }
    ca <- cos(angle)
    sa <- sin(angle)
    # prepare result matrices
    d <- matrix(NA, nrow(occ), nrow(sites))
    transect <- list(x=matrix(0, nrow(sites), 6), y=matrix(0, nrow(sites), 6))
    tnm <- c("topleft", "start", "bottomleft", "bottomright", "end", "topright")
    colnames(transect$x) <- colnames(transect$y) <- tnm

    for (i in 1:nrow(sites)) {
        p <- unlist(sites[i,])
        crd <- t(p + t(cm))
        m <- matrix(c(ca[i], sa[i], -sa[i], ca[i]), 2)
        ## center and rotate all occ points
        ro <- t(t(m) %*% (t(occ) - p))
        test <- ro[,1] > -hl & ro[,1] < hl & ro[,2] > -drng & ro[,2] < drng
        d[test,i] <- abs(ro[test,2])
        # rotate transect
        r_crd <- t((m %*% (t(crd) - p)) + p)
        transect$x[i,] <- r_crd[,1]
        transect$y[i,] <- r_crd[,2]
    }
    list(distance=d, transect=transect)
}
