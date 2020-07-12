  NEI <- readRDS("./data/summarySCC_PM25.rds")
  SCC <- readRDS("./data/Source_Classification_Code.rds")
  aggregated<-aggregate(Emissions ~ year , NEI,sum)
  png("plot1.png")
  barplot(height = aggregated$Emissions,names.arg = aggregated$year,xlab = "years",ylab = 
            expression("total emission of pm25"),main = "total emission of pm25 at various year")
  dev.off()
  