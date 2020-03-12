library(tidyverse)

dd <- read_csv(input_files[[1]])

print(names(dd))

provincedat <- (dd
	%>% gather(key="date", value="Confirmed"
		, -`Province/States`, -`Country/Region`,-`WHO region`
	)
	%>% transmute(Province_State = `Province/States`
		, Country_Region = `Country/Region`
		, WHO_region = `WHO region`
		, date = as.Date(paste0("0",date,"20"),format="%m/%d/%Y")
		, CumCases = Confirmed
		)
	%>% rowwise()
	%>% group_by(Province_State,Country_Region)
	%>% mutate(Cases = diff(c(CumCases,NA))
		)
	%>% ungroup()
)
print(provincedat)

print(provincedat %>% filter(Cases < 0))


countrydat <- (provincedat
	%>% group_by(Country_Region, date)
	%>% summarise(Cumcases = sum(CumCases,na.rm=TRUE)
		, Cases = sum(Cases,na.rm=TRUE)
	)
)

globaldat <- countrydat %>% filter(Country_Region == "Globally")


