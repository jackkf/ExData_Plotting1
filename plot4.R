data <- read.table("household_power_consumption.txt",header = T,sep = ";", na.strings = "?", stringsAsFactors =  F)
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data$DateTime <- (strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))


png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", main = "", ylab = "Global Active Power")
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", main = "", ylab = "Voltage")
plot(data$DateTime, data[,7], type = "l", xlab = "", main = "", ylab = "Energy sub metering", col = "black")
lines(data$DateTime, data[,8], col = "red")
lines(data$DateTime, data[,9], col = "blue")
legend("topright",names(data[,7:9]),bty = "n", lty = c(1,1,1), col=c("black","red", "blue"), cex = 0.85)
plot(data$DateTime, data[,4], type = "l", xlab = "datetime", main = "", ylab = "Global_reactive_power", col = "black")
dev.off()
