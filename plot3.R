dati<-read.table("household_power_consumption.txt", header = TRUE, sep=";", dec=".",
                 stringsAsFactors = F)
dati_r <- dati[dati$Date %in% c("1/2/2007","2/2/2007") ,]

dati_r$Date <- as.Date(dati_r$Date, format="%d/%m/%Y")

dati_r$datetime <- paste(as.Date(dati_r$Date), dati_r$Time)
dati_r$datetime <- as.POSIXct(dati_r$datetime)

plot(dati_r$datetime,dati_r$Sub_metering_1, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(dati_r$datetime,dati_r$Sub_metering_2,col='Red')
        lines(dati_r$datetime,dati_r$Sub_metering_3,col='Blue')

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2.5, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
