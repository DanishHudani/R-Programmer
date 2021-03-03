library(dplyr)

counties = readRDS("C:/Users/ABC/Desktop/Datacamp/R-Programmer/datasets/counties.rds")

# Glimpse the counties table
glimpse(counties)

# Select state, county, population, and industry-related columns
counties %>% select(state, county, population, professional:production)


# Arrange service in descending order 
counties %>% select(state, county, population, professional:production) %>%
  arrange(desc(service))


# Select the state, county, population, and those ending with "work"
counties %>% select(state, county, population, ends_with("work"))

# Filter for counties that have at least 50% of people engaged in public work
counties %>% select(state, county, population, ends_with("work")) %>%
  filter(public_work > 50)

# Rename the n column to num_counties
counties %>%
  count(state) %>%
  rename(num_counties = n)

# Select state, county, and poverty as poverty_rate
counties %>% select(state, county, poverty_rate = poverty)

# Keep the state, county, and populations columns, and add a density column
counties %>% transmute(state, county, population, density = population / land_area)

# Filter for counties with a population greater than one million 
counties %>% 
  transmute(state, county, population, density = population / land_area) %>%
  filter(population > 1000000)

# Sort density in ascending order 
counties %>% 
  transmute(state, county, population, density = population / land_area) %>%
  filter(population > 1000000) %>%
  arrange(density)

# Change the name of the unemployment column
counties %>%
  rename(unemployment_rate = unemployment)

# Keep the state and county columns, and the columns containing poverty
counties %>%
  select(state, county, contains("poverty"))

# Calculate the fraction_women column without dropping the other columns
counties %>%
  mutate(fraction_women = women / population)

# Keep only the state, county, and employment_rate columns
counties %>%
  transmute(state, county, employment_rate = employed / population)




