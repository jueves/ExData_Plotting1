#Import data

mydata <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)

#Convert mydata$Date as date
mydata[, 1] <- as.Date(mydata[, 1], "%d/%m/%Y")

#Select dates
mydays <-  mydata[mydata$Date %in% as.Date(c('2007-02-01', '2007/02/02')),]

#Convert Global_active_power as numeric
  
mydays$Global_active_power <- as.numeric(as.character(mydays$Global_active_power))

#Create the plot
  
hist(mydays$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

#Export the plot
  
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()