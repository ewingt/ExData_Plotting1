# old.dir <- getwd()	# BMAP workdirectory # dir.create("EDA1")
# setwd("EDA1")	# getwd()	
.path_outc <- file.path("household_power_consumption.txt")		
elec <- read.table(.path_outc, na.string = "?", sep=";", skip=66637, nrows=2881, stringsAsFactors=FALSE)
names(elec) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


Dat <- with(elec, paste(Date, Time))    # summary(Dat)    # head(Dat,10)        
elec$DateTime <- strptime(x=Dat, format="%d/%m/%Y %H:%M:%S"); # class(elec$DateTime)
elec$Date2 <- as.Date(elec$DateTime);                         # class(elec$Date2)
elec$wkday <- with(elec, weekdays(Date2, abbreviate=TRUE))
    # elec$wkday <- factor(elec$wkday, levels=c("Thu", "Fri", "Sat")) 
    # abc <- relevel(abc, "Thu", "Fri", "Sat")

png(filename="plot2.png", width=480, height=480, bg="transparent")
with(elec, plot(x=DateTime, y=Global_active_power, type="l", ann=FALSE))
title(ylab="Global Active Power (kilowatts)")
dev.off()
