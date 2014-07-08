# Download the file if necessary
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "exdata_data_household_power_consumption.zip"
if (!file.exists(file)) {
   download.file(url, file, method="curl")
}

# Read in and format the data for our needs
data <- read.table(unz(file, "household_power_consumption.txt"), header=TRUE, sep=";", na.strings="?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Create the plot in plot3.png
png("plot3.png")
with(data, {plot(data$datetime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
            points(data$datetime, data$Sub_metering_2, type="l", col="red")
            points(data$datetime, data$Sub_metering_3, type="l", col="blue")
            legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col=c("black", "red", "blue"))
})
dev.off()