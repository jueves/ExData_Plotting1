library(dplyr)
#Import data
mydata <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)

#Select dates
mydays <- filter(mydata, Date == "1/2/2007" | Date == "2/2/2007")

#Fix time class
mydays <- mutate(mydays, Full_Date = paste(mydays$Date, mydays$Time))
mydays$Full_Date <- strptime(mydays$Full_Date, "%d/%m/%Y %H:%M:%S")

#Convert Global_active_power as numeric
mydays$Global_active_power <- as.numeric(as.character(mydays$Global_active_power))

#Create the plot
par(mfcol=c(2,2))

#Plot 1
plot(mydays$Full_Date, mydays$Global_active_power, type="l", xlab=NA, ylab="Global Active Power")

#Plot 2
plot(mydays$Full_Date, mydays$Sub_metering_1, type="n", xlab=NA, ylab="Energy sub metering")
lines(mydays$Full_Date, mydays$Sub_metering_1)
lines(mydays$Full_Date, mydays$Sub_metering_2, col="red")
lines(mydays$Full_Date, mydays$Sub_metering_3, col="blue")
#Add legend Plot2
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=2,  bty = "n", y.intersp=0.3, inset=c(0.15, 0))

#Plot 3
plot(mydays$Full_Date, mydays$Voltage, type="l", xlab="Datetime", ylab="Voltage")

#Plot 4
plot(mydays$Full_Date, mydays$Global_reactive_power, type="l", xlab="Datetime", ylab="Global_reactive_power")

#Export the plot
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()

