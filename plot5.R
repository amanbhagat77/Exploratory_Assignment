library(dplyr)
library(ggplot2)
library(scales)
library(data.table)

#LOADING THE DATASET
pm25 <-readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code")

#CODE TO PRODUCE REQUIRED PLOT

mergedata <- merge(scc , baltimore,by = "SCC")
motor.baltimore <- mergedata %>% group_by(year) %>% summarize(Emissions = sum(Emissions))

ggplot(data = motor.baltimore,aes(x = factor(year),y = Emissions,fill = "#2ac984"))
geom_bar(stat = "identity")+
xlab("Year")+
ylab(expression("Total tons of PM"[2.5]*"Emission"))+
ggtitle(expression("Total tons of PM"[2.5]*"Emission by motor vehicles in Baltimore City"))+
guides(fill = FALSE)

dev.copy(png, file= "Plot5.png",height = 680 , width = 480) # Saving to png file
dev.off()
