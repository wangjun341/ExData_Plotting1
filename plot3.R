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
png(file ="plot3.png", bg = "transparent",width = 480, height = 480)

##plot
plot(data$merge_date_time,data$Sub_metering_1,type="l",col = "black",xlab="",ylab="Energy sub metering")
lines(data$merge_date_time,data$Sub_metering_2,col="red")
lines(data$merge_date_time,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,xjust=0, 
       ,lty=1,col=c("black","red","blue"),bg="transparent",box.col=1)

#close the graphic device
dev.off()
