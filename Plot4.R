source('./utils.R')
download_unzip_data()
power_data = get_data()

png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
par(mar = c(2.5, 4.5, 2, 1))
with(power_data, plot(Global_active_power ~ datetime, type = "l",
                 ylab = "Global active power (kilowatts)", xlab = NA))

with(power_data, plot(Voltage ~ datetime, type = "l",
                 ylab = "Voltage", xlab = NA))

with(power_data, plot(Sub_metering_1 ~ datetime, type = "n",
                 ylab = "Energy sub metering", xlab = NA))
lines(power_data$datetime, power_data$Sub_metering_1, col = "black")
lines(power_data$datetime, power_data$Sub_metering_2, col = "red")
lines(power_data$datetime, power_data$Sub_metering_3, col = "blue")
legend("topright", bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"))

with(power_data, plot(Global_reactive_power ~ datetime, type = "l",
                 ylab = "Global reactive power (kilowatts)", xlab = NA))
dev.off()
print ("plot4 done")