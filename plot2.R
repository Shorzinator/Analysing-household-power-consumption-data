power <- read.table("household_power_consumption.txt", skip = 1,
                    sep = ";")

#assigning proper names to the columns in the dataset
names(power) <- c("Date", "Time", "Global_active_power",
                  "Global_reactive_power", "Voltage", "Global_intensity",
                  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#taking the subset of the main set
subpower <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")

#converting date and time to operatable formats
subpower$Date <- as.Date(subpower$Date, format = "%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format = "%H:%M:%S")
subpower[1:1440, "Time"] <- format(subpower[1:1440,"Time"], "2007-02-01 %H:%M:%Y")
subpower[1441:2880, "Time"] <- format(subpower[1441:2880, "Time"], "2007-02-02 %H:%M:%Y")


#Plotting our function
plot(subpower$Time, as.numeric(as.character(subpower$Global_active_power)), 
     xlab = "", ylab = "Global Active Power (killowatts)", type = "l")

dev.copy(png, "plot2.png")
dev.off()