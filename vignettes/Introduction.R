## ----init, message=FALSE------------------------------------------------------

# Install and load packages

# install.packages(c("ggptt", "dplyr", "tidyr", "scales"))

library(ggptt)
library(dplyr)


# Clear possible settings
unset_ptt()

# data for examples
pdat <- economics %>% 
  select(date, psavert, uempmed) %>% 
  tidyr::gather(vars, values, -date)
  


## ----ptt_colours--------------------------------------------------------------
scales::show_col(ptt_pal(6))

## ----vnk_colours--------------------------------------------------------------
scales::show_col(vnk_pal(4))

## ----scale_colour-------------------------------------------------------------

p <- ggplot(pdat, aes(x = date, y = values, colour = vars)) + 
  geom_line()

p

p + scale_colour_ptt()


## ----theme_ptt----------------------------------------------------------------

p + theme_ptt()


## ----set_ptt------------------------------------------------------------------

set_ptt()
p


## ----the----------------------------------------------------------------------

p + the_legend_bot()

p + the_title_blank()

p + the_title_blank(c("x", "l"))

p + the_x45()

## ----format-------------------------------------------------------------------

p + scale_x_date(labels = no_century)

# Percents
pdat2 <- pdat %>% mutate(values = values/100)
p %+% pdat2 + scale_y_continuous(labels = percent_comma)

# comma
p %+% pdat2 + scale_y_continuous(labels = deci_comma)


## ----h0-----------------------------------------------------------------------

p + geom_h0()


## ----share_legend-------------------------------------------------------------

grid_arrange_shared_legend(p, p + geom_h0(), ncol = 2)


## ----extra_break--------------------------------------------------------------

p + scale_y_continuous(breaks = extra_breaks(17))


