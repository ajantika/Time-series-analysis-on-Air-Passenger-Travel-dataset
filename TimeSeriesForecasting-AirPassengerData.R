#title: "Time Series Forecasting"

  
  #AUTHOR: AJANTIKA PAUL

#Loading the dataset:


data("AirPassengers")
AP.ts<- AirPassengers



#The data set contains the AirPassengers travel rate from the year 1949 to 1960

#Checking the dataset

class(AP.ts)
start(AP.ts) 
end(AP.ts) 
frequency(AP.ts) 
summary(AP.ts)



#It starts from year 1949 (January); It ends at 1960 (December) and the Frequency interval is 12



#Time period of the dataset


cycle(AP.ts) 
aggregate(AP.ts) #adds up all of the months for each year
plot(aggregate(AP.ts))



#It has trend.

#Box Plot


boxplot(AP.ts~cycle(AP.ts))
        
      

aggregate(AP.ts, FUN=mean)


#Average frequesncy per month for each year;  average monthly travel increased from 126 in 1949 to 476 in 1960


#July and August have the highest travel volume

#There is growth in the airline passenges numbers, it increases steadily.
#There is trend and seasonality.
#We can infer that passengers might prefer to travel during summer holiday, again there might be a downfall, and the number can again increase during christmas holiday

#Time series plot:
  
  
  
plot(AP.ts)
plot(AP.ts, ylab="Passengers (1000s)", type="o", pch=20)
abline(reg=lm(AirPassengers~time(AirPassengers)))




#We can see from in the time series there seems to be seasonal variation in the number of AirPassenger Travel Rate.



#Decomposing the data 


decompose(AP.ts)
plot(decompose(AP.ts))

#The plot above shows the original time series (top), the estimated trend component (second from top), the estimated seasonal component (third from top), and the estimated irregular component (bottom). 


#Autocorrelation

acf(AP.ts)

#We can see that there is lot of persistence from one period to another.

#It is corellated over time.
#There is seasonality, we can a high peak at one year, air travel today is much correlated with air travel one year ago

#Blue line is the confidence interval where anything outside the boundary has significant relation.



#Holt Winters Method

plot(HoltWinters(AP.ts, alpha=0.001, beta=1, gamma=0))


#Black graph is the original data and red graph is the Holt-Winters

AR.hw <- HoltWinters(AP.ts, seasonal="additive")

summary(AR.hw)



#Predictions

#We are predicting ahead by 10 years

AR.predict<-predict(AR.hw, n.ahead=10*12)
ts.plot(AP.ts, AR.predict, lty=1:2)



#Predicted values of  AirTravel Rates.

AR.predict


#ETS- Error Trend and Seasonality.


library(forecast)


ets_forecast <- ets(AP.ts)
ets_forecast



#We can see that alpha = 0.73 which is close to one which means that more weight is place on the most recent observations. 

#ETS(A,Ad,N) - Error type-"A"=Multiplicative,, Tread-additive, Seasonality- Multiplicative

plot(ets_forecast)
attributes(ets)
attributes(ets_forecast)
ets_forecast$mse #MSE gives an overall idea of the error occurred during forecasting. 






#Forecast

#To make a forecast of Air Passengers Travel for the year 1961 to 1970 using forecast



forecast.ets(ets_forecast, h=120)




#The forecast ets() function gives  the forecast for a year, a 80% prediction interval for the forecast, and a 95% prediction interval for the forecast. For example, the forecasted Air pasenger travel rate for the year 1970 is about 504,with a 95% prediction interval of (1031).




forecast_ets <- forecast.ets(ets_forecast, h=96)
plot(forecast_ets)



#Here the forecasts are plotted as a blue line, the 80% prediction interval as an dark grey shaded area, and the 95% prediction interval as a light grey shaded area.

#Seasonally Adjusting:
  

library(forecast)
AP_adjust <-seasadj(decompose(AP.ts))
AP_adjust

plot(AP_adjust)


#We can see that the seasonal variation has been removed from the seasonally adjusted time series. The seasonally adjusted time series now just contains the trend component and an irregular component.

#Partial autocorrelation
pacf(AP.ts)




#Regression on time dimension



AP.reg<-lm(AP.ts~time(AP.ts))
summary(AP.reg)
confint(AP.reg)
acf(resid(AP.reg))
pacf(resid(AP.reg))




#ARIMA (Autoregressive integrated moving average)
#MA(3)

AP.ma <- arima(AP.ts, order=c(0,0,3)) #estimates moving average of three time periods of "white noise"

ar=auto.arima(AP.ts)
summary(ar)


#ARMA(1,1)


AP.arma <- arima(AP.ts, order=c(1,0,1)) #1 prior period of AP, 1 prior period of white noise



#ARIMA(2,1,2)
#This model is composed of 2 prior periods of AP, 2 prior periods of white noise and a first-order difference


AP.arima <- arima(AP.ts, order=c(2,1,2)) 
AP.predict<-predict(AP.arima, n.ahead=60)
ts.plot(AP.ts,AP.predict$pred, lty=1:2)





#GARCH
#Generalized autoregressive conditioned heteroskedastic



library(tseries)
garch(AP.ts, grad="numerical")





