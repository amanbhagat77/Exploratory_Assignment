pm25 <- readRDS("summarySCC_PM25.rds")
emssionTrend <- tapply(pm25$Emissions, pm25$year, mean)
emissionTrend <- as.data.frame(emissionTrend)

library(data.table)
setDT(emissionTrend, keep.rownames = "year")
plot(emissionTrend$year,emissionTrend$emissions,type = 'l',ylab = "Emission",xlab = "Years")
title("Emission Rate over the years")