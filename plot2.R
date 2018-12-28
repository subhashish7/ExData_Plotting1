# set working directory
setwd('C:/Users/Desktop/Coursera/EDA')

# read file
data <- read.csv('household_power_consumption.txt', header = TRUE, sep=';', dec='.', stringsAsFactors = FALSE)

# select data from relevant dates
df <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# convert datetime format
df$datetime = strptime(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S")

# open device
png("plot2.png", width=480, height=480)

# plot graph
plot(df$datetime,df$Global_active_power,
     type="l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     cex.lab = 0.9
)
# close device
dev.off()
