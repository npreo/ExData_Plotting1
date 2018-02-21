dati<-read.table("household_power_consumption.txt", header = TRUE, sep=";", dec=".",
                 stringsAsFactors = F)
dati_r <- dati[dati$Date %in% c("1/2/2007","2/2/2007") ,]

dati_r$Date <- as.Date(dati_r$Date, format="%d/%m/%Y")

dati_r$datetime <- paste(as.Date(dati_r$Date), dati_r$Time)
dati_r$datetime <- as.POSIXct(dati_r$datetime)

plot(dati_r$Global_active_power~dati_r$datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
