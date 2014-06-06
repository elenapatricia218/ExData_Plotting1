##Exploratory Data Analysis
##Course Project 1
##Plot 3

#this code reads in the power conservation data
#and plots a distribution of Energy sub metering by section 
        # (kitchen, laundry, wh/ac) over time

#read in the dataset
power_cons <- read.delim("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#check header
head(power_cons)
#check number of rows and columns
nr <- nrow(power_cons)
nc <- ncol(power_cons)
nr
nc
#convert time and date columns
Date <- as.Date(power_cons$Date,"%d/%m/%Y")
head(Date)
Time=strptime(paste(Date,power_cons$Time),"%Y-%m-%d %H:%M:%S")
head(Time)
#Weekdays=unique(weekdays(Time))
#head(Weekdays)

#concatenate to make updated formatted dset
power_cons2 <- cbind(Date,Time,power_cons[,3:9])
head(power_cons2)

#subset only required dates
power_cons_sub <- subset(power_cons2, Date>="2007-02-01" & Date <="2007-02-02")
#take a look at the data
head(power_cons_sub)
nrow(power_cons_sub)
ncol(power_cons_sub)

#set up the plot
png(file="Plot3.png")
#line plot, setting y label and no x label
with(power_cons_sub,plot(Time,Sub_metering_1, type="l",
                         ylab="Energy sub metering",
                         xlab=""))
with(power_cons_sub,points(Time,Sub_metering_2, type="l", col="red"))
with(power_cons_sub,points(Time,Sub_metering_3, type="l",col="blue"))
legend("topright",
       pch="-",
       col=c("black","red","blue"), #12*14
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##dev.copy(png,file="plot3.png") #copy my plot to a PNG file
dev.off() #dont forget to close the PNG device

