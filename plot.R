library(ggplot2);theme_set(theme_bw())
library(tidyverse)



gg <- (ggplot(globaldat, aes(x=date, y=Cases))
	+ geom_line(color="black", label="Global")
	+ scale_y_log10()
)

print(gg)

gg2 <- (gg
	+ geom_line(data=(countrydat %>% filter(Country_Region == "Mainland China")),color="blue", label="Mainland China")
)

print(gg2)

gg3 <- (gg
	+ geom_line(data=(provincedat %>% filter(Province_State == "Hubei")), color="red")
)

print(gg3)

