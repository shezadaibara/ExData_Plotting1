source('./utils.R')
download_unzip_data()
power_data = get_data()

png(file = "plot2.png", width = 480, height = 480, units = "px")
with(power_data, plot(Global_active_power ~ datetime, type = "l",
                 ylab = "Global active power (kilowatts)", xlab = NA))
dev.off()
print ("plot2 done")