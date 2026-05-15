countOcc <- 
function(dmat) {
    count <- data.frame(site_ID = 1:ncol(dmat), count = NA)
    for (i in 1:nrow(count)) {
        count[i, "count"] <- sum(!is.na(dmat[,i]))
    }
    count
}