# old.dir <- getwd()	# BMAP workdirectory # dir.create("EDA1")
# setwd("EDA1")	# getwd()	
.path_outc <- file.path("household_power_consumption.txt")		
elec <- read.table(.path_outc, na.string = "?", sep=";", skip=66637, nrows=2881, stringsAsFactors=FALSE)
names(elec) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")   # 6
png(filename="plot1.png", width=480, height=480, bg="transparent")
hist(elec$Global_active_power, col=2, ann=FALSE)
title(main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
