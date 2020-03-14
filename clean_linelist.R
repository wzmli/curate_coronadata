library(tidyverse)

fixdates <- function(x){
	return(as.Date(x,format="%d.%m.%Y"))
}

cleandat <- (dat
	%>% mutate(age = as.numeric(age)
		, onset_d = fixdates(onset_d)
		, admission_d = fixdates(admission_d)
		, confirm_d = fixdates(confirm_d)
		, dod_d = fixdates(dod_d)
		, travel_d = fixdates(travel_d)
		, symptoms2admission = as.numeric(admission_d - onset_d)
		, symptoms2confirmation = as.numeric(confirm_d - onset_d)
		, travel2symptoms = as.numeric(onset_d - travel_d)
		, sex = as.factor(sex)
		, city = as.factor(city)
		, province = as.factor(province)
		, symptoms = as.factor(symptoms)
		, outcome = as.factor(outcome)
		, country = as.factor(country)
	)
)

print(summary(cleandat))

with(cleandat, {
	print(sort(unique(country)))
	print(unique(outcome))
})

delay <- (cleandat
	%>% select(symptoms2admission
		, symptoms2confirmation
		, travel2symptoms
	)
	%>% gather(key = "type", value="Days")
)

print(delay
	%>% group_by(type)
	%>% filter(!is.na(Days))
	%>% summarise(count = n())
)

