# set working directory
setwd('C:/Users/Desktop/Coursera/EDA')

# read file
data <- read.csv('household_power_consumption.txt', header = TRUE, sep=';', dec='.', stringsAsFactors = FALSE)

# select data from relevant dates
df <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# convert datetime format
df$datetime = strptime(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S")

# open device
png("plot4.png", width=480, height=480)

# plot graph
par(mfrow=c(2,2))

plot(df$datetime,df$Global_active_power,
     type="l",
     xlab = "",
     ylab = "Global Active Power",
     cex.lab = 0.9
)

plot(df$datetime,df$Voltage,
     xlab ="datetime",
     ylab = "Voltage", 
     type="l",
     cex.lab = 0.9
)

plot(df$datetime,df$Sub_metering_1,
     type="l",
     xlab = "",
     ylab = "Energy sub metering",
     cex.lab = 0.9
)
lines(df$datetime,df$Sub_metering_2,col="red")
lines(df$datetime,df$Sub_metering_3,col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n",
       lty=1,
       col=c("black","red","blue")
)

plot(df$datetime,df$Global_reactive_power,
     xlab ="datetime",
     ylab = "Global_reactive_power", 
     type="l",
     cex.lab = 0.9
)

# close device
dev.off()
