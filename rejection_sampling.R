packages <- c("GGally","data.table","broom","ggplot2","tabplot","gridExtra")

for (package in packages) {
  if (!require(package, character.only=T, quietly=T)) {
    install.packages(package,repos='http://lib.stat.cmu.edu/R/CRAN') 
  }
}

for (package in packages) {
  library(package, character.only=T)
}

thm <- theme_classic() + 
  theme(
    legend.position = "top",
    legend.background = element_rect(fill = "transparent", colour = NA),
    legend.key = element_rect(fill = "transparent", colour = NA)
  )
theme_set(thm)

# simulate some data
expit <- function(x){ exp(x)/(1+exp(x)) }
logit <- function(x){ log(x/(1-x)) }

n = 2000
c1 <- rnorm(n)
c2 <- rbinom(n,1,.5)
x  <- rbinom(n,1,expit(-2+log(1.5)*c1+log(1.5)*c2))
y  <- rbinom(n,1,expit(-2+log(1.5)*x+log(1.5)*c1+log(1.5)*c2))

D<-data.frame(y,x,c1,c2)

head(D)


