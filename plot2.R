library(dplyr)
library(ggplot2)
library(scales)
library(data.table)

#LOADING THE DATASET
pm25 <-readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code")

#CODE TO PRODUCE REQUIRED PLOT
baltimore <- pm25 %>% 
  filter(fips == "24510") %>% 
  group_by(year) %>% 
  summarize(Annual.Total = sum(Emissions));
baltimore.pts <- pretty(baltimore$Annual.Total/1000);
plot(baltimore$year, baltimore$Annual.Total/1000, type = "l", lwd = 2, axes = FALSE,
     xlab = "Year", 
     ylab = expression("Total Tons of PM"[2.5]*" Emissions"), 
     main = expression("Total Tons of PM"[2.5]*" Emissions in Baltimore"));
axis(1, at = c(1999,2002,2005,2008))
axis(2, at = baltimore.pts, labels = paste(baltimore.pts, "K", sep = ""));
box();

dev.copy(png,file = "plo2.png")
dev.off()
