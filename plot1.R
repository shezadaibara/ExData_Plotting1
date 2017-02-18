source('./utils.R')
download_unzip_data()
power_data = get_data()

png(file = "plot1.png", width = 480, height = 480, units = "px")
with(power_data, hist(Global_active_power, col = "red", 
                      xlab = "Global active power (kilowatts)", 
                      main = "Global Active power"))
dev.off()
print ("plot1 done")