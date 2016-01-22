# Read in power consumption data
power <- read.table("household_power_consumption.txt", header=T, sep=";",na.strings="?",stringsAsFactors = F)
power$Date <- as.Date(power$Date,"%d/%m/%Y")
power <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")



# Plots are to be saved as a 480x480 png file, which are the default dimensions 
png(filename="plot1.png")

# Make plot 1, a histogram of the Global_active_power measurements for this subset of the data
hist(power$Global_active_power,col="red",
     main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()