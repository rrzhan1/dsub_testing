#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

df = read.table(args[1], header=FALSE, strip.white = TRUE)

trim <- function (x) gsub("^\\s+|\\s+$", "", x)

vec = vector('character')

for(i in 1:nrow(df)){ if(trim(df[i, 1]) == "real") vec = c(vec, trim(df[i, 2])) }

new_vec = vector('numeric')

for(i in 1:length(vec)){a=strsplit(vec[i], "[ms]"); new_vec = c(new_vec,(as.numeric(unlist(a)[1]) * 60 + as.numeric(unlist(a)[2])))}

jpeg(args[2])
plot(new_vec)
dev.off()

