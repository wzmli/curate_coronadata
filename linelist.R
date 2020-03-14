library(gsheet)
library(dplyr)
library(readr)

dd <- gsheet2tbl("https://docs.google.com/spreadsheets/d/1itaohdPiAeniCXNlntNztZ_oRvjh0HsGuJXUJWET008/edit")

dat <- (dd
	%>% select(ID, age, sex, city,province, country
		, symptoms
		, onset_d=date_onset_symptoms
		, admission_d = date_admission_hospital
		, confirm_d = date_confirmation
		, dod_d = date_death_or_discharge
		, lives_in_Wuhan
		, travel_d = travel_history_dates
		, travel_location = travel_history_location
		, source
		, outcome
	)
)

print(dat)
summary(dat)

write_csv(dat, csvname)

