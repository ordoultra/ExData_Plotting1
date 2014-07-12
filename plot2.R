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

dev.new()
png(paste0(path,'plot2.png'), width = 480, height = 480, units = "px")

#Setup graph window layout
# The example graph images have a transparent background however the 
# background color has been determined to be not relevant to the problem.
# If it were required this is how it would be achieved: 
#  plot(HN[c(10,3)], type="l", ylab="Global Active Power", xlab="", bg="transparent")

# Top Left Graph - [Global Active Power] / datetime
plot(HN[c(10,3)], type="l", ylab="Global Active Power (kilowatts)", xlab="")


dev.off()



