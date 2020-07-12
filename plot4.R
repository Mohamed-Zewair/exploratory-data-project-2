NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
library(ggplot2)
NEISCC<- merge(NEI,SCC, by = "SCC")
colMatches<-grepl("coal",NEISCC$Short.Name,ignore.case = TRUE)
subsetNEISCC<-NEISCC[colMatches,]
aggregated<-aggregate(Emissions ~ year,subsetNEISCC,sum)
png("plot4.png",width = 640,height = 480)
g <- ggplot(aggregated,aes(factor(year), Emissions))
g <-g + geom_bar(stat = "identity")+xlab("year")+ylab(expression('Total PM'[2.5]*"Emissions"))+ ggtitle("Total Emissions from coal sources from 1999 to 2008")
 
print(g
      )
dev.off()