path <- "./"
H <- read.csv(paste0(path,"household_power_consumption.txt"), 
				colClass=c("factor","factor", 
				rep("numeric",7)), 
				sep = ";", 
				na.strings = "?")

#between dates: 2007-02-01 and 2007-02-02
H['DateTime'] <- as.POSIXct(paste(H$Date, H$Time), format="%d/%m/%Y %H:%M:%S")
H[[1]] <- as.Date(H[[1]], format="%d/%m/%Y")
HN <- subset(H, H$Date >= as.Date("2007-02-01", format="%Y-%m-%d") & 
                H$Date <= as.Date("2007-02-02", format="%Y-%m-%d"))

png(paste0(path,'plot1.png'), width = 480, height = 480, units = "px")

#Setup graph window layout
# The example graph images have a transparent background however the 
# background color has been determined to be not relevant to the problem.
# If it were required this is how it would be achieved: p
#  hist(HN[[3]], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", bg="transparent")
hist(HN[[3]], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()

