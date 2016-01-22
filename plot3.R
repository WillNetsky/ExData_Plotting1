# Read in power consumption data
power <- read.table("household_power_consumption.txt", header=T, sep=";",na.strings="?",stringsAsFactors = F)
power$DateTime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date,"%d/%m/%Y")
power <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")


# Plots are to be saved as a 480x480 png file, which are the default dimensions 
png(filename="plot3.png")

# Make plot 1, a histogram of the Global_active_power measurements for this subset of the data

with(power,plot(DateTime,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(power,lines(DateTime,Sub_metering_1))
with(power,lines(DateTime,Sub_metering_2,col="red"))
with(power,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

dev.off()
