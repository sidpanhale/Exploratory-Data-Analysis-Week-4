if(!exists("NEI")){
  NEI <- readRDS("D:/Projects/Exploratory-Data-Analysis-Week-4/dataStore/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("D:/Projects/Exploratory-Data-Analysis-Week-4/dataStore/Source_Classification_Code.rds")
}

#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
baltcitymary.emissions<-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
require(dplyr)
baltcitymary.emissions.byyear <- summarise(group_by(baltcitymary.emissions, year), Emissions=sum(Emissions))
require(ggplot2)
ggplot(baltcitymary.emissions.byyear, aes(x=factor(year), y=Emissions,fill=year, label = round(Emissions,2))) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions in tons")) +
  ggtitle("Emissions from motor vehicle sources in Baltimore City")+
  geom_label(aes(fill = year),colour = "white", fontface = "bold")