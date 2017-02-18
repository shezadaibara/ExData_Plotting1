source('./utils.R')
download_unzip_data()
power_data = get_data()

png(file = "plot3.png", width = 480, height = 480, units = "px")
with(power_data, plot(Sub_metering_1 ~ datetime, type = "n",
                 ylab = "Energy sub metering", xlab = NA))
lines(power_data$datetime, power_data$Sub_metering_1, col = "black")
lines(power_data$datetime, power_data$Sub_metering_2, col = "red")
lines(power_data$datetime, power_data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()