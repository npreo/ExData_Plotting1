dati<-read.table("household_power_consumption.txt", header = TRUE, sep=";", dec=".",
                 stringsAsFactors = F)
dati_r <- dati[dati$Date %in% c("1/2/2007","2/2/2007") ,]

dati_r$Date <- as.Date(dati_r$Date, format="%d/%m/%Y")

dati_r$datetime <- paste(as.Date(dati_r$Date), dati_r$Time)
dati_r$datetime <- as.POSIXct(dati_r$datetime)

dati_r$Global_active_power <- as.numeric(dati_r$Global_active_power)
dati_r$Global_reactive_power <- as.numeric(dati_r$Global_reactive_power)
dati_r$Voltage <- as.numeric(dati_r$Voltage)
dati_r$Sub_metering_1 <- as.integer(dati_r$Sub_metering_1)
dati_r$Sub_metering_2 <- as.integer(dati_r$Sub_metering_2)
dati_r$Sub_metering_3 <- as.integer(dati_r$Sub_metering_3)

attach(dati_r)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
