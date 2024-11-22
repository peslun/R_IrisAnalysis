# activate renv ----
library(renv)
renv::init()
renv::install("gitcreds")

library(gitcreds)
gitcreds_set()

# preparation ----

renv::install("tidyverse")
library(tidyverse)
renv::snapshot(prompt=0)