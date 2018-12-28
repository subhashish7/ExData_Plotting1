# set working directory
setwd('C:/Users/Desktop/Coursera/EDA')

# read file
data <- read.csv('household_power_consumption.txt', header = TRUE, sep=';', dec='.', stringsAsFactors = FALSE)

# select data from relevant dates
df <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# open device
png("plot1.png", width=480, height=480)

# plot histogram
hist(as.numeric(df$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# close device
dev.off()
