library(tidyverse)

dd <- read_csv("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/who_covid_19_situation_reports/who_covid_19_sit_rep_time_series/who_covid_19_sit_rep_time_series.csv")
print(names(dd))

dd <- (dd
	%>% select(Province_State = `Province/States`
		, Country_Region = `Country/Region`
		, contains("1/")
		, contains("2/")
		, contains("3/")
	)
)

print(names(dd))
