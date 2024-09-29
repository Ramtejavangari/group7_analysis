# Global Terrorism Database Collaborative Analysis

# Load necessary libraries
library(dplyr)
library(ggplot2)

file_path <- "C:/Users/ramte/Desktop/DSPI/Assignment 1/globalterrorismdb_0718dist.csv"

# Load the dataset
gtd_data <- read.csv(file_path, 
                     stringsAsFactors = FALSE)

# Basic data exploration
glimpse(gtd_data)

head(data)


str(data)

summary(data)

dim(data)

colnames(data)

null_count <- sum(is.na(data$iyear))
null_count


#Group 7: Analyze Trends Over Time
  
#Role 1: Prepare data by decade.

data <- data %>%
  mutate(decade = floor(iyear / 10) * 10)

print(data$decade)


#Role 2: Calculate the change in attack frequency over time.

  
events_by_decade <- data %>%
  group_by(decade) %>%
  summarise(event_count = n()) %>%
  arrange(decade)

print(events_by_decade)

events_by_decade <- events_by_decade %>%
  mutate(change = event_count - lag(event_count))

print(events_by_decade)


# Role 3: Visualize trends using a line chart.


{r}
ggplot(events_by_decade, aes(x = decade, y = event_count)) +
  geom_line(color = "blue", size = 1) +
  geom_point(size = 3, color = "red") +
  labs(title = "Attack Frequency Over Time by Decade",
       x = "Decade",
       y = "Number of Events") +
  theme_minimal()
