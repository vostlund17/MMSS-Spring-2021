
library(tidyverse)
libary(janitor)

data <- read_csv("Facebook dataset.csv")
data <- janitor::clean_names(data)

data_long <- read_csv("Long Term Prediction.csv")
data_long <- janitor::clean_names(data_long)

ggplot(data) +
  aes(x = date) +
  geom_line(aes(y = number_users), color = "steelblue") +
  geom_line(aes(y = total_infected), color = "red", linetype = "dashed") +
  labs(x = "Year", y = "Millions of Users", title = "Monthly Active Facebook Users Over Time") +
  geom_text(data = NULL, aes(x = as.Date("2015-01-01"), y = 1700), color = "red", label = "Prediction" ) +
  geom_text(data = NULL, aes(x = as.Date("2016-06-01"), y = 1600), color = 'steelblue', label = "Actual") +
  theme_bw()

ggplot(data_long) +
  aes(x = date) +
  geom_line(aes(y = number_users), color = "steelblue") +
  geom_line(aes(y = long_term_pred), color = "red", linetype = "dashed") +
  labs(x = "Year", y = "Millions of Users", title = "Monthly Active Facebook Users Over Time: Long Term Prediction") +
  geom_text(data = NULL, aes(x = as.Date("2030-01-01"), y = 4500), color = "red", label = "Long Term Prediction" ) +
  geom_text(data = NULL, aes(x = as.Date("2010-01-01"), y = 1000), color = 'steelblue', label = "Actual") +
  theme_bw()