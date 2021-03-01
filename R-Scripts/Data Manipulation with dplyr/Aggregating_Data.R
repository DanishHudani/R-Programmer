library(dplyr)

counties = readRDS("C:/Users/ABC/Desktop/Datacamp/R-Programmer/datasets/counties.rds")

counties_selected <- counties %>%
  select(region, state, population, citizens)

# Use count to find the number of counties in each region
counties_selected %>% count(region, sort = TRUE)
#From our result, we can see that South is the region with the most counties.

# Find number of counties per state, weighted by citizens
counties_selected %>% count(state, wt = citizens, sort = TRUE)
# From our result, we can see that California is the state with the most citizens.


counties_selected <- counties %>% select(region, state, population, walk)

# Add population_walk containing the total number of people who walk to work 
counties_selected %>% mutate(population_walk = population * walk / 100) 

# Count weighted by the new column
counties_selected %>% mutate(population_walk = population * walk / 100) %>% 
  count(state, wt = population_walk, sort = TRUE) 
# We can see that while California had the largest total population, 
#New York state has the largest number of people who walk to work.


counties_selected <- counties %>%
  select(county, population, income, unemployment)

# Summarize to find minimum population, maximum unemployment, and average income
counties_selected %>% 
  summarize(min_population = min(population), max_unemployment = max(unemployment),
            average_income = mean(income))

counties_selected <- counties %>% select(state, county, population, land_area)

# Group by state and find the total area and population
counties_selected %>% group_by(state) %>% 
  summarize(total_area = sum(land_area), total_population = sum(population))

# Add a density column, then sort in descending order
counties_selected %>%
  group_by(state) %>%
  summarize(total_area = sum(land_area), total_population = sum(population)) %>% 
  mutate(density = total_population / total_area) %>%
  arrange(desc(density))
# New Jersey and Rhode Island are the “most crowded” of the US states, with more 
#than a thousand people per square mile.

counties_selected <- counties %>% select(region, state, county, population)

# Summarize to find the total population
counties_selected %>%
  group_by(region, state) %>%
  summarize(total_pop = sum(population))

# Calculate the average_pop and median_pop columns 
counties_selected %>%
  group_by(region, state) %>%
  summarize(total_pop = sum(population)) %>%
  group_by(region) %>%
  summarize(average_pop = mean(total_pop), median_pop = median(total_pop))
# South has the highest average_pop of 7370486, while the North Central region
#has the highest median_pop of 5580644.

counties_selected <- counties %>% select(region, state, county, metro, population, walk)

# Group by region and find the greatest number of citizens who walk to work
counties_selected %>% group_by(region) %>% top_n(1, walk)
# The three of the places lots of people walk to work are low-population non metro 
# counties, but that New York City also pops up!

counties_selected <- counties %>% select(region, state, county, population, income)

# Calculate average income
counties_selected %>%
  group_by(region, state) %>%
  summarize(average_income = mean(income))


# Find the highest income state in each region
counties_selected %>%
  group_by(region, state) %>%
  summarize(average_income = mean(income)) %>%
  top_n(1, average_income)

# From our results, we can see that the New Jersey in the Northeast is the state 
# with the highest average_income of 73014


counties_selected <- counties %>% select(state, metro, population)

# Count the states with more people in Metro or Nonmetro areas
counties_selected %>%
  group_by(state, metro) %>%
  summarize(total_pop = sum(population)) %>%
  top_n(1, total_pop) %>%
  ungroup(state) %>%
  count(metro)



















