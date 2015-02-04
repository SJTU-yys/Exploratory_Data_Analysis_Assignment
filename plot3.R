Sys.setlocale("LC_TIME", "English")
## Read the data in, just using data from the dates 2007-02-01 and 2007-02-02
df <- read.table("household_power_consumption.txt", sep = ';',  skip = '66637',  nrow = 2879)
header <- read.table("household_power_consumption.txt", sep = ';', header = TRUE, nrow = 1)
names(df) <- names(header)

## Convert the variable Data and Time class into POSIXlt
df$Date <- as.character(df$Date)
df$Time <- as.character(df$Time)
df$Time <- strptime(paste(df$Date, df$Time),  format = "%d/%m/%Y %H:%M:%S")
df$Date <- strptime(df$Date,"%d/%m/%Y")

## Draw the plot picture
par(mfrow = c(1,1))
plot(df$Time, df$Sub_metering_1, type = "n", ylab="Energy sub metering", xlab = "")
lines(df$Time, df$Sub_metering_1, col = "black")
lines(df$Time, df$Sub_metering_2, col = "red")
lines(df$Time, df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col =c("black","red","blue"), lty = c("solid", "solid", "solid"), cex = 0.5)

## Save the plot as a png file
dev.copy(png, file = 'plot3.png')
dev.off()