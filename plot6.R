balcal <- merge(pm25, scc,by = "SCC")
fips_balcal <- balcal[balcal$fips == "24510" | balcal$fips == "06037"]
aggregated.balcal <- fips_balcal %>% filter(type == "ON-ROAD") %>% group_by(fips,year,type) %>% summarize(Total.Emissions = sum(Emissions))
aggregated.balcal$fips <- factor(aggregated.balcal$fips)
levels(aggregated.balcal$fips) = c("California", "Baltimore")
ggplot(data = aggregated.balcal, aes(x = factor(year), y = Total.Emissions,fill =fips )) +
     geom_bar(stat = "identity")+
     facet_grid(.~ fips) +
     xlab("Year")+
     ylab(expression("Total tons of PM"[2.5]*" EMissions"))+
     ggtitle(expression("Comparision of total PM"[2.5]*" emission by motor vehicle between California and Baltimore"))+
     guides(fill = FALSE)

dev.copy(png, file = "plot6.png",height = 680 , width = 680)
dev.off()