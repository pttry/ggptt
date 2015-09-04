## ----init, message=FALSE-------------------------------------------------

library(ggptt)
library(dplyr)
library(tidyr)

# to clear possible settings
unset_ptt()

pdat <- economics %>% 
  select(date, psavert, uempmed) %>% 
  gather(vars, values, -date)
  


## ----ptt_colours---------------------------------------------------------
scales::show_col(ptt_pal(6))

## ----vnk_colours---------------------------------------------------------
scales::show_col(vnk_pal(4))

## ----scale_colour--------------------------------------------------------

p <- ggplot(pdat, aes(x = date, y = values, colour = vars)) + 
  geom_line()

p

p + scale_colour_ptt()


## ----theme_ptt-----------------------------------------------------------

p + theme_ptt()


## ----set_ptt-------------------------------------------------------------

set_ptt()
p


## ----the-----------------------------------------------------------------

p + the_legend_bot()

p + the_title_blank()

p + the_title_blank(c("x", "l"))

p + the_x45()

## ----format--------------------------------------------------------------

p + scale_x_date(labels = no_century)

# Percents
pdat2 <- pdat %>% mutate(values = values/100)
p %+% pdat2 + scale_y_continuous(labels = percent_comma)

# comma
p %+% pdat2 + scale_y_continuous(labels = deci_comma)


