library(tidyverse)

dd <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv")
print(names(dd))

dd <- (dd
	%>% select(Province_State = `Province/State`
		, Country_Region = `Country/Region`
		, everything()
		, -Lat, -Long
	)
)

print(names(dd))
