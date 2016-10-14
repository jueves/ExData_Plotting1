library(dplyr)
#Import data
mydata <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)

#Select dates
mydays <- filter(mydata, Date == "1/2/2007" | Date == "2/2/2007")

#Fix time class
mydays <- mutate(mydays, Full_Date = paste(mydays$Date, mydays$Time))
mydays$Full_Date <- strptime(mydays$Full_Date, "%d/%m/%Y %H:%M:%S")

#Create the plot
plot(mydays$Full_Date, mydays$Sub_metering_1, type="n", xlab=NA, ylab="Energy sub metering")
lines(mydays$Full_Date, mydays$Sub_metering_1)
lines(mydays$Full_Date, mydays$Sub_metering_2, col="red")
lines(mydays$Full_Date, mydays$Sub_metering_3, col="blue")

#Add legend
legend("topright", legend=c(names(mydays)[7], names(mydays)[8], names(mydays)[9]), col=c("black", "red", "blue"), lwd=2)
#Export the plot
dev.copy(png, file = "plot3.png")
dev.off()