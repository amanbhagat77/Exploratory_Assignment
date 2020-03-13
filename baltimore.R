baltimore <- subset(pm25,pm25 == "24510")
baltimore_emissions <- tapply(baltimore$Emissions,baltimore$year,mean)
baltimore_emissions <- as.data.frame(baltimore_emissions)
setDT(baltimore_emissions,keep.rownames = "year")
colnames(baltimore_emissions) <- c("year" , "Emissions")
plot(baltimore_emissions$year,baltimore_emissions$Emissions,type = 'l',ylab = "Emissions(mean)",xlab = "Years",main = "Baltimore Emission Trend over the years"