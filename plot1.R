library("readr")

## Bringing in the data as a data frame 
epc_data <- read_csv2("household_power_consumption.txt", col_names = TRUE)

## change class of all columns to correct class
epc_data$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
epc_data$Time <- format(powerdata$Time, format="%H:%M:%S")
epc_data$Global_active_power <- as.numeric(powerdata$Global_active_power)
epc_data$Global_reactive_power <- as.numeric(powerdata$Global_reactive_power)
epc_data$Voltage <- as.numeric(powerdata$Voltage)
epc_data$Global_intensity <- as.numeric(powerdata$Global_intensity)
epc_data$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
epc_data$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2)
epc_data$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3)

## subset data from 2007-02-01 and 2007-02-02
new_data <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")

## plot histogram of global active power for those 2 days
png("plot1.png", width=480, height=480)
hist(new_data$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()