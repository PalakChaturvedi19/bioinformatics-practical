
install.packages("covid19.analytics")

# library
library("covid19.analytics")

# clear environment
rm(list = ls())

#data
ag = covid19.data(case = "aggregated")
tsc = covid19.data(case = "ts-confirmed")

#summary
summary(covid19.data(case = "aggregated"))
report.summary(Nentries = 10, graphical.output = TRUE)

# totals per location
tots.per.location(tsc,geo.loc = "US")
tots.per.location(tsc,geo.loc = c("US","India"))

#growthrate
growth.rate(tsc,geo.loc = "India")

#world map
live.map(tsc)

#SIR Model
generate.SIR.model(tsc,"US",tot.population = 328200000 )

