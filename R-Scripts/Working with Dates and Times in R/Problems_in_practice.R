library(readr)

# Game2: CAN vs NZL in Edmonton
game2 <- mdy_hm("June 11 2015 19:00")

# Game3: CHN vs NZL in Winnipeg
game3 <- mdy_hm("June 15 2015 18:30")

# Set the timezone to "America/Edmonton"
game2_local <- force_tz(game2, tzone = "America/Edmonton")
game2_local

# Set the timezone to "America/Winnipeg"
game3_local <- force_tz(game3, tzone = "America/Winnipeg")
game3_local

# How long does the team have to rest?
as.period(game2_local %--% game3_local)

# Edmonton and Winnipeg are in different timezones, so even though the start times of the games only look 
# 30 minutes apart, they are in fact 1 hour and 30 minutes apart, and the team only has 3 days, 22 hours and 30 minutes
# to prepare.



# What time is game2_local in NZ?
with_tz(game2_local, tzone = "Pacific/Auckland")

# What time is game2_local in Corvallis, Oregon?
with_tz(game2_local, tzone = "America/Los_Angeles")

# What time is game3_local in NZ?
with_tz(game3_local, tzone = "Pacific/Auckland")


# Examine datetime and date_utc columns
head(akl_hourly$datetime)
head(akl_hourly$date_utc)

# Force datetime to Pacific/Auckland
akl_hourly <- akl_hourly %>%
  mutate(
    datetime = force_tz(datetime, tzone = "Pacific/Auckland"))

# Reexamine datetime
head(akl_hourly$datetime)

# Are datetime and date_utc the same moments
table(akl_hourly$datetime - akl_hourly$date_utc)



# Import auckland hourly data 
akl_hourly <- read_csv("datasets/akl_weather_hourly_2016.csv")

# Examine structure of time column
str(akl_hourly$time)

# Examine head of time column
head(akl_hourly$time)

# A plot using just time
ggplot(akl_hourly, aes(x = time, y = temperature)) +
  geom_line(aes(group = make_date(year, month, mday)), alpha = 0.2)

dates <- akl_hourly$date_utc


library(microbenchmark)
install.packages("fasttime")
library(fasttime)

# Examine structure of dates
str(dates)

# Use fastPOSIXct() to parse dates
fastPOSIXct(dates) %>% str()

# Compare speed of fastPOSIXct() to ymd_hms()
microbenchmark(
  ymd_hms = ymd_hms(dates),
  fasttime = fastPOSIXct(dates),
  times = 20)


# Head of dates
head(dates)

# Parse dates with fast_strptime
fast_strptime(dates,  format = fast_strptime(dates, format = "%y-%m-%d H:M:Sz")) %>% str()



# Head of dates
head(dates)

# Parse dates with fast_strptime
fast_strptime(dates, format = "%Y-%m-%dT%H:%M:%SZ") %>% str()

# Compare speed to ymd_hms() and fasttime
microbenchmark(
  ymd_hms = ymd_hms(dates),
  fasttime = fastPOSIXct(dates),
  fast_strptime = fast_strptime(dates, format = "%Y-%m-%dT%H:%M:%SZ"), times = 20)


# Create a stamp based on "Saturday, Jan 1, 2000"
date_stamp <- stamp("Saturday, Jan 1, 2000")

# Print date_stamp
date_stamp

# Call date_stamp on today()
date_stamp(today())

# Create and call a stamp based on "12/31/1999"
stamp("12/31/1999")(today())

finished <- "I have completed my date and time module in R on Saturday Jan 1, 2000"

# Use string finished for stamp()
stamp(finished)(today())




