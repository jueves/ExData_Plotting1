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
plot(mydays$Full_Date, mydays$Global_active_power, type="l", xlab=NA, ylab="Global Active Power (kilowatts)")

#Export the plot
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
