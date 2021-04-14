## -----------------------------------------------------------------------------
coefs  <- lapply(split(iris, iris$Species),
                 function(dat) lm(Petal.Length~Sepal.Length, dat)$coef)
coefs <- do.call("rbind",coefs)
coefs <- as.data.frame(coefs)
coefs$Species <- rownames(coefs)
coefs

library(lookup)
iris = transform(iris,
                 slope1 = lookup(iris$Species, coefs$Species, coefs[,"Sepal.Length"]),
                 slope2 = vlookup(iris$Species, coefs, "Species", "Sepal.Length"))
head(iris)

