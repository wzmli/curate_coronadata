library(tidyverse)

dd <- read_csv("https://raw.githubusercontent.com/open-covid-19/data/master/output/data.csv")
print(names(dd))

dd <- (dd %>% select(-Latitude, -Longitude))

print(dd)

italy <- (dd 
	%>% filter(CountryName == "Italy")
	%>% group_by(Date)
	%>% summarise(Confirmed = sum(Confirmed,na.rm=TRUE))
	%>% mutate(Confirmed = as.numeric(Confirmed)
		, incidence = diff(c(Confirmed,NA))
		)
)

print(italy,n=200)

