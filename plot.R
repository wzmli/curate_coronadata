library(ggplot2);theme_set(theme_bw())
library(tidyverse)



gg <- (ggplot(countrydat, aes(x=date, y=Cases,color=Country_Region))
	+ geom_line()
	+ scale_y_log10()
)

print(gg)



