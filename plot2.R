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
with(df, plot(Time, Global_active_power, type = "l", col = "black", xlab = "", ylab = "Global Active Power(in kilowatt)"))

## Save the plot as a png file
dev.copy(png, file = 'plot2.png')
dev.off()