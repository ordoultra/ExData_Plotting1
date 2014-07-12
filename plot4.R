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
png(paste0(path,'plot4.png'), width = 480, height = 480, units = "px")

#Setup graph window layout
# The example graph images have a transparent background however the 
# background color has been determined to be not relevant to the problem.
# If it were required this is how it would be achieved: par(mfrow=c(2,2), bg="transparent")
par(mfrow=c(2,2))

# Top Left Graph - [Global Active Power] / datetime
plot(HN[c(10,3)], type="l", ylab="Global Active Power", xlab="")

# Top Right Graph - [Voltage] / datetime
plot(HN[c(10,5)], type="l", xlab="datetime") 

# Bottom Left Graph - [Energy sub metering] / datetime
plot(HN[c(10,7)], type="s", ylab="Energy sub metering", xlab="")
lines(HN[c(10,8)], type="s", col="red")
lines(HN[c(10,9)], type="s", col="blue")
legend("topright", # places a legend at the appropriate place 
c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # puts text in the legend
bty = "n", #no border
cex = .95, #make the legend smaller to better match the example
lwd=c(1,1,1),col=c("black","red","blue")) # gives the legend lines the correct color and width

# Bottom Right Graph - [Global_reactive_power] / datetime
plot(HN[c(10,4)], type="l", xlab="datetime")

dev.off()



