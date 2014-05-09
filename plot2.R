#read raw data
raw.data<-read.table("./household_power_consumption.txt",head=TRUE,sep=";",na.strings="?")

#merge date & time
raw.data$tmp_merge_date_time<-paste(raw.data$Date,raw.data$Time,sep=" ")

#change variable class into POSIXlt
raw.data$merge_date_time<-as.POSIXlt(strptime(raw.data$tmp_merge_date_time, "%d/%m/%Y %H:%M:%S"))

#subset of Feb 1st & 2nd
data<-subset(raw.data,as.Date(raw.data$merge_date_time)==as.Date("2007-02-01","%Y-%m-%d")|
            as.Date(raw.data$merge_date_time)==as.Date("2007-02-02","%Y-%m-%d"))

#output png file
png(filename = "plot2.png",width = 480, height = 480, bg = "transparent")

#plot
plot(data$merge_date_time,data$Global_active_power,type="l", 
     ylab="Global Active Power (kilowatts)",xlab="")

#close the graphic device
dev.off()
