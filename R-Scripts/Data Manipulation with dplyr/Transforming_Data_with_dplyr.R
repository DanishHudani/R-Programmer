library(dplyr)

counties = readRDS("C:/Users/ABC/Desktop/Datacamp/R-Programmer/datasets/counties.rds")

glimpse(counties)

# Select the columns 
counties %>% select(state, county, population, poverty)

counties_selected <- counties %>%
  select(state, county, population, private_work, public_work, self_employed)

# Add a verb to sort in descending order of public_work
counties_selected %>% arrange(desc(public_work))

counties_selected <- counties %>%
  select(state, county, population)

# Filter for counties with a population above 1000000
counties_selected %>% filter(population > 1000000)

# Filter for counties in the state of California that have a population above 1000000
counties_selected %>% filter(state == "California", population > 1000000)

counties_selected <- counties %>%
  select(state, county, population, private_work, public_work, self_employed)

# Filter for Texas and more than 10000 people; sort in descending order of private_work
counties_selected %>% filter(state == "Texas", population > 10000) %>%
  arrange(desc(private_work))

counties_selected <- counties %>%
  select(state, county, population, public_work)

# Add a new column public_workers with the number of people employed in public work
counties_selected %>% mutate(public_workers = population * public_work / 100)

# Sort in descending order of the public_workers column
counties_selected %>%
  mutate(public_workers = public_work * population / 100) %>% 
  arrange(desc(public_workers))
# It looks like Los Angeles is the county with the most government employees.

# Select the columns state, county, population, men, and women
counties_selected <- counties %>% select(state, county, population, men, women)


# Calculate proportion_women as the fraction of the population made up of women
counties_selected %>% mutate(proportion_women = women / population)

# Select the five columns 
counties %>% select(state, county, population, men, women)

# Add the proportion_men variable
counties %>% select(state, county, population, men, women) %>% 
  mutate(proportion_men = men / population)

# Filter for population of at least 10,000
counties %>% select(state, county, population, men, women) %>% 
  mutate(proportion_men = men / population) %>% filter(population > 10000)

# Arrange proportion of men in descending order 
counties %>% select(state, county, population, men, women) %>% 
  mutate(proportion_men = men / population) %>% filter(population > 10000) %>% 
  arrange(desc(proportion_men))
# Notice Sussex County in Virginia is more than two thirds male



