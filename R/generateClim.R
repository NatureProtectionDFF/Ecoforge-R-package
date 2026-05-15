generateClim <-
function(nrow=101, ncol=101, Tmean=15, Tsd=4, Trange=45, 
                         Tamp_max=10, Tamp_min=1, Tar_max=10, Tar_min=5,
                         Pmean=500, Psd=300, Prange=45, Pav_max=50, 
                         Pav_min=10) {

    grd <- expand.grid(x = 1:ncol, y = 1:nrow)

    # Temperature simulation data
    model_temp <- gstat(formula=z~1, locations=~x+y, dummy=T, beta=Tmean, 
                        model=vgm(psill=Tsd**2, range=Trange, model="Sph"),
                        nmax=40)

    temp <- predict(model_temp, newdata=grd, nsim=1)
    colnames(temp) <- c("x", "y", "temp")

    # Precipitation simulation data (based on lognormal distribution)
    v <- log(Psd**2/exp(2*log(Pmean)) + 1)
    u <- log(Pmean) - v/2
    model_prec <- gstat(formula=z~1, locations=~x+y, dummy=T, beta=u, 
                        model=vgm(psill=v, range=Prange, model="Sph"),
                        nmax=40)
    prec <- exp(predict(model_prec, newdata=grd, nsim=1)[,3])


    # Latitudinal and temperature covariates for daily amplitude
    model_amp <- gstat(formula=z~y+temp, locations=~x+y, dummy=T, 
                       beta=c(0, 1/nrow*10, 0.8), 
                       model=vgm(psill=Tsd**2, range=Trange, model="Sph"),
                       nmax=40)

    amp <- predict(model_amp, newdata=temp, nsim=1)[,3]
    amp <- (amp-min(amp))/diff(range(amp)) * (Tamp_max-Tamp_min) + Tamp_min

    # Latitudinal gradient for Annual range and precipitation variation
    y <- (grd$y - min(grd$y))/diff(range(grd$y))
    e <- (Tar_max - Tar_min)*0.05
    tar <- y * Tar_min + (Tar_max - Tar_min) + rnorm(length(y), 0, e)
    e <- (Pav_max - Pav_min)*0.02
    pav <- y * Pav_min + (Pav_max - Pav_min) + rnorm(length(y), 0, e)

    clim <- data.frame(grd, temp=temp[,3], daily_amp=amp, annual_range=tar,
                       prec=prec, prec_variation=pav)
    clim
}
