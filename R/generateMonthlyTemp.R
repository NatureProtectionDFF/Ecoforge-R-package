#' @export
generateMonthlyTemp <-
function(x, daily_amp, annual_rng, err_sdev=1,
                                verbose=TRUE) {
    twopi <- 2*pi
    l <- 8640
    tmin <- tmax <- matrix(NA, length(x), 12)
    tavg <- matrix(0, length(x), 12)
    for (month in 1:12) {
        if (verbose) cat("Generating data for", month.name[month], "\n")
        # For each hour in a month
        start_h <- 720 * (month-1)
        end_h <- start_h + 719
        for (h in start_h:end_h) {
            m_season <- annual_rng * -cos(h/l*twopi)
            d_season <- daily_amp * -cos(h%%24/23*twopi)
            err <- rnorm(length(x), 0, err_sdev)
            h_temp <- x + m_season + d_season + err
            tmin[,month] <- pmin(tmin[,month], h_temp, na.rm=T)
            tmax[,month] <- pmax(tmax[,month], h_temp, na.rm=T)
            tavg[,month] <- tavg[,month] + h_temp
        }        
    }
    tavg <- tavg / 720
    list(tmin=tmin, tavg=tavg, tmax=tmax)
}
