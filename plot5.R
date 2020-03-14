
library(dplyr)
library(ggplot2)

mergedata <- merge(scc , baltimore,by = "SCC")
motor.baltimore <- mergedata %>% group_by(year) %>% summarize(Emissions = sum(Emissions))

ggplot(data = motor.baltimore,aes(x = factor(year),y = Emissions,fill = "#2ac984"))
geom_bar(stat = "identity")+
xlab("Year")+
ylab(expression("Total tons of PM"[2.5]*"Emission"))+
ggtitle(expression("Total tons of PM"[2.5]*"Emission by motor vehicles in Baltimore City"))+
guides(fill = FALSE)