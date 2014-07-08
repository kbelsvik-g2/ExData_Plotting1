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

# Create the plot in plot2.png
png("plot2.png")
with(data, plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()