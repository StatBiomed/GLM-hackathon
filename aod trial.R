library('aod')
endog <- read.csv(file = 'star98_endog.csv', header = FALSE)
exog <- read.csv(file = 'star98_exog.csv', header = FALSE)
endog[, 2] <- endog[, 1] + endog[, 2]
names(endog)[1] <- "y"
names(endog)[2] <- "n"
data = cbind(endog, exog)
fm <- betabin(cbind(y, n - y) ~ V1 + V2 + V3 + V4 + V5 + V6 + V7 + V8 + V9 + V10 + V11 + V12 + V13 + V14 + V15 + V16 + V17 + V18 + V19 + V20, ~ 1, data = data)
para <- fm@param
param <- c(para[3 : length(para) - 1], para[1], para[length(para)])
param <- unname(param)
write.csv(param, "param_aod.csv")