if(!exists("NEI")){
  NEI <- readRDS("D:/Projects/Exploratory-Data-Analysis-Week-4/dataStore/summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("D:/Projects/Exploratory-Data-Analysis-Week-4/dataStore/Source_Classification_Code.rds")
}


#Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
require(ggplot2)
require(dplyr)
baltcitymary.emissions.byyear<-summarise(group_by(filter(NEI, fips == "24510"), year,type), Emissions=sum(Emissions))
# clrs <- c("red", "green", "blue", "yellow")
ggplot(baltcitymary.emissions.byyear, aes(x=factor(year), y=Emissions, fill=type,label = round(Emissions,2))) +
  geom_bar(stat="identity") +
  #geom_bar(position = 'dodge')+
  facet_grid(. ~ type) +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emission in tons")) +
  ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
                                     "City by various source types", sep="")))+
  geom_label(aes(fill = type), colour = "white", fontface = "bold")