#reading the text file
power <- read.table("household_power_consumption.txt", skip = 1,
                    sep = ";")

#assigning proper names to the columns in the dataset
names(power) <- c("Date", "Time", "Global_active_power",
                  "Global_reactive_power", "Voltage", "Global_intensity",
                  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#taking the subset of the main set
subpower <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")

#making the required historam
hist(as.numeric(subpower$Global_active_power), col = "red", 
     xlab = "Global Active Power (killowatts)",
     main = "Global Active Power")

#annotating the graph
title(main = "Global Active Power")

#copying the data to a png device
dev.copy(png, "plot1.png")
dev.off()
