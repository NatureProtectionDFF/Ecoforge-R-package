generateVar <- 
function(nrow, ncol, Vmean, Vsd, Vrange) {
    grd <- expand.grid(x = 1:ncol, y = 1:nrow)

    # Variable simulation data
    model_varb <- gstat(
        formula = z ~ 1, locations = ~ x + y, dummy = T, beta = Vmean,
        model = vgm(psill = Vsd**2, range = Vrange, model = "Sph"),
        nmax = 40
    )

    variab <- predict(model_varb, newdata = grd, nsim = 1)
    colnames(variab) <- c("x", "y", "value")


    variab_df <- data.frame(variab)
    variab_df
}
