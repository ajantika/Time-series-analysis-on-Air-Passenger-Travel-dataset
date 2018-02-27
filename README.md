# Time-series-analysis-on-Air-Passenger-Travel-dataset
## Monthly Airline Passenger Numbers 1949-1960

## Steps:

Index


1. Reading time series data
2. Plotting time series
3. Decomposing Time series
4. Forecast
5. ARIMA Models

## CONCLUSION AND FEW IMPORTANT TERMS

The Air Passenger dataset has seasonal effect and trend. 
While forecasting, we can see that alpha = 0.73 which is close to one which means that more weight is place on the most recent observations. 

######  Trend component

Long-run increase or decrease over time (overall upward or downward movement)
Trend can be linear or nonlinear such as exponential growth

#### Seasonality

A seasonal pattern exists when a series is influenced by seasonal factors (e.g., the quarter of the year, the month, or day of the week). Seasonality is always of a fixed and known period. 


## Stationary Series
1.The mean of the series should not be a function of time rather should be a constant
2.The variance of the series should not a be a function of time. 
3. The covariance should not be a function of time.

## Holt-Winters exponential smoothing

Holt-Winters exponential smoothing estimates the level, slope and seasonal component at the current time point. Smoothing is controlled by three parameters: alpha, beta, and gamma, for the estimates of the level, slope b of the trend component, and the seasonal component, respectively, at the current time point. 


## Seasonally Adjusting
If we have a seasonal time series that can be described using an additive model, we can seasonally adjust the time series by estimating the seasonal component, and subtracting the estimated seasonal component from the original time series
