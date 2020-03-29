library(tidyverse)

summary(dd)

provincedat <- (dd
	%>% gather(key="date", value="CumCases"
		, -Province_State, -Country_Region
	)
	%>% mutate(date = as.Date(paste0("0",date,"20"),format="%m/%d/%Y"))
	%>% group_by(Province_State,Country_Region)
	%>% mutate(Cases = diff(c(CumCases,NA)))
	%>% ungroup()
)

countrydat <- (provincedat
	%>% group_by(Country_Region, date)
	%>% summarise(Cumcases = sum(CumCases,na.rm=TRUE)
		, Cases = sum(Cases,na.rm=TRUE)
	)
	%>% filter(Country_Region %in% c("United Kingdom", "Italy")) 
)

print(countrydat,n=200)

