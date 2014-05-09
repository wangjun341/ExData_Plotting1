#read raw data
raw.data<-read.table("./household_power_consumption.txt",head=TRUE,sep=";",na.strings="?")

#transform the Date column into date class
raw.data$Date<-as.Date(raw.data$Date,"%d/%m/%Y")

#subsetting Feb.1st and 2nd's data
data<-subset(raw.data,raw.data$Date==as.Date("2007-02-01","%Y-%m-%d")|raw.data$Date==as.Date("2007-02-02","%Y-%m-%d"))

#output png file
png(filename = "plot1.png",width = 480, height = 480, bg = "transparent")

#plot a histogram
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#close the graphic device
dev.off()