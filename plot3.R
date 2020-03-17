library(dplyr)
library(ggplot2)
library(scales)
library(data.table)

#LOADING THE DATASET
pm25 <-readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code")

#CODE TO PRODUCE REQUIRED PLOT

baltimore <- subset(pm25 , pm25$fips == "24510")

baltimore$type <- factor(baltimore$type, levels = c("ON-ROAD", "NON-ROAD", "POINT", "NONPOINT")) #Re ordered the factor variables so that it plots as we wish
ggplot(data = baltimore, aes(x = factor(year), y = Emissions,fill =type )) +
  geom_bar(stat = "identity")+
  facet_grid(.~ type) +
  xlab("Year")+
  ylab(expression("Total tons of PM"[2.5]*" EMissions"))+
  ggtitle(expression("Total PM"[2.5]*" Emission in Baltimore by Source Type"))+
  guides(fill = FALSE)

dev.copy(png, file = "plot3.png",height = 680 , width = 680)
dev.off()
