generateMonthlyPrec <-
function(x, annual_var, err_sdev=0.1) {
    h <- 1:12/12*2*pi
    err <- matrix(rnorm(12*length(x), 0, err_sdev), length(x))
    w <- annual_var %*% t(cos(h) + 1) + err
    w <- w - min(w)
    w <- w / rowSums(w)
    m_prec <- floor(x * w)
    m_prec
}
