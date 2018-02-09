#BF
#Assignmnet3

# 1) Plot the datasets to see how it looks. What can we tell from these?

data("AirPassengers")
AP.ts<- AirPassengers

class(AP.ts)
str(AP.ts)

#Maximum value
max(AP.ts)


#Observation

#The data set contains the AirPassengers travel rate from the year 1949 to 1960
start(AP.ts); end(AP.ts); frequency(AP.ts);

#It starts from year 1949 (January); It ends at 1960 (December) and the Frequency interval is 12

# 2) Check if there exists a seasonality or trend using plot and state your results with valid reasons


#Time series plot:
plot(AP.ts)
plot(AP.ts, ylab="Passengers (1000s)", type="o", pch=20)
abline(reg=lm(AirPassengers~time(AirPassengers)))


#Time period of the dataset
cycle(AP.ts) 
aggregate(AP.ts) #adds up all of the months for each year
plot(aggregate(AP.ts))

#Box Plot
boxplot(AP.ts~cycle(AP.ts))



aggregate(AP.ts, FUN=mean)
#average frequesncy per month for each year;  average monthly travel increased from 126 in 1949 to 476 in 1960



#July and August have the highest travel volume

#There is growth in the airline passenges numbers, it increases steadily.
#There is trend and seasonality.
# We can infer that passengers might prefer to travel during summer holiday, again there might be a downfall, and the number can again increase during christmas holiday


#Decomposing the data 

decompose(AP.ts, type= "multiplicative")

AP.decompM <- decompose(AP.ts, type= "multiplicative")
plot(AP.decompM)

#3) Plot Autocorrelation graph and see if there exists seasonality or trend and explain the results

acf(AP.ts)

#It is corellated over time.
#There is seasonality, we can a high peak at one year, air travel today is much correlated with air travel one year ago

#Blue line is the confidence interval where anything outside the boundary has significant relation.



