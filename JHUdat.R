library(tidyverse)

dd <- read_csv(input_files[[1]])
print(names(dd))

dd <- (dd
	%>% select(Province_State = `Province/State`
		, Country_Region = `Country/Region`
		, everything()
		, -Lat, -Long
	)
)

print(names(dd))
