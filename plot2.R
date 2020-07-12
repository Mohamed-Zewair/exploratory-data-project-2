NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
subsNEI <- NEI[NEI$fips=="24510",]
aggregated<-aggregate(Emissions ~ year,subsNEI,sum)
png("plot2.png")
barplot(height = aggregated$Emissions,names.arg = aggregated$year,xlab = "years",
        ylab = expression("total pm25 emission"),main = "total pm25 emmision for baltimore city at various year")
dev.off()

