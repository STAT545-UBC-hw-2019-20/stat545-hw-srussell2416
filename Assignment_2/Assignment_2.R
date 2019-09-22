library(gapminder)
library(tidyverse)

#1.1-2
gapminder %>%
  filter(country == "Canada" | country == "United States" | country == "Mexico", 
         year >= 1970 & year <= 1979 ) %>%
  select(country, gdpPercap)

#1.3
gapminder %>%
  arrange(year) %>%
  group_by(country) %>%
  mutate(inc_lifeExp = c(NA,diff(lifeExp))) %>%
  filter(inc_lifeExp < 0)

#1.4
gapminder %>%
  group_by(country) %>%
  filter(gdpPercap == max(gdpPercap))
  
#1.5
gapminder %>%
  filter(country == "Canada") %>%
  select(lifeExp, gdpPercap) %>%
  ggplot(aes(x = lifeExp, y = gdpPercap)) +
    scale_y_continuous(trans="log10") +
    geom_point() +
    theme_bw()

#2
levels(gapminder$continent)
range(gapminder$pop)


ggplot(gapminder,aes(x = pop)) +
  facet_grid(gapminder$continent) +
  scale_x_continuous(trans = "log10") +
  geom_density() 

#3

ggplot(gapminder, aes(x = pop, y = lifeExp, color = country, alpha = year)) +
  scale_x_continuous(trans= "log10") +
  facet_grid(gapminder$continent) +
  geom_point() +
  theme(legend.position = "none")
gapminder %>%
  filter(continent=="Asia") %>%
ggplot(aes(x = year, y = pop, color = country)) +
  geom_line() +
  theme(legend.position = "none")
