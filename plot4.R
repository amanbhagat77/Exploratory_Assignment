library(dplyr)
library(ggplot2)
library(scales)
library(data.table)

#LOADING THE DATASET
pm25 <-readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code")

#Code to produce Required plot
coal.US <- merge(pm25, coal.scc, by = "SCC")
coal.annual <- coal.US %>% group_by(year) %>% summarize(Annual.Emissions = sum(Emissions)) 

ggplot(data = coal.annual,aes(x = factor(year), y = Annual.Emissions,fill = year))+
    geom_bar(stat = "identity")+
    ylab(expression("Total Tons of PM"[2.5]*" Emissions"))+
    xlab(expression("Year"))+
    ggtitle(expression("Total tons of PM"[2.5]*" Emission in United States from Coal-Combustion related sources"))+
    scale_y_continuous(labels = comma) +
    guides(fill = FALSE)

dev.copy(png, file = "plot4.png",height = 680 , width = 680)
dev.off()