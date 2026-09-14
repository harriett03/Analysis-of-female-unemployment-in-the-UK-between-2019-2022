# female-unemployment-uk-statistical-analysis
# ------------------------------------------

# Load required packages
install.packages("readr")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("knitr")
library(readr)
library(dplyr)
library(ggplot2)
library(knitr)

# ------------------------------------------
# Load ONS data directly from web
# ------------------------------------------

female_unemp_rate <- read_csv(
  "https://www.ons.gov.uk/file?uri=/employmentandlabourmarket/peopleinwork/unemployment/timeseries/mgsz/lms/mgsz.csv")

female_unemp_number <- read_csv(
  "https://www.ons.gov.uk/file?uri=/employmentandlabourmarket/peopleinwork/employmentandemployeetypes/timeseries/mgtr/lms/mgtr.csv")

male_unemp_rate <- read_csv(
  "https://www.ons.gov.uk/file?uri=/employmentandlabourmarket/peopleinwork/unemployment/timeseries/mgcy/lms/mgcy.csv")

# ------------------------------------------
# Data preparation
# ------------------------------------------

female_unemp_rate <- female_unemp_rate %>%
  select(Year = time, Female_Unemployment_Rate = value)

male_unemp_rate <- male_unemp_rate %>%
  select(Year = time, Male_Unemployment_Rate = value)

female_unemp_number <- female_unemp_number %>%
  select(Year = time, Female_Unemployed_Thousands = value)

# Descriptive statistics ----------------------------

summary_stats <- female_unemp_rate %>% 
  summarise(
    Mean = mean(Female_Unemployment_Rate, na.rm = TRUE),
    Median = median(Female_Unemployment_Rate, na.rm = TRUE),
    Min = min(Female_Unemployment_Rate, na.rm = TRUE),
    Max = max(Female_Unemployment_Rate, na.rm = TRUE),
    SD = sd(Female_Unemployment_Rate, na.rm = TRUE)
  )

kable(summary_stats, caption = "Descriptive Statistics: Female Unemployment Rate")

# Graphs --------------------------------------------

ggplot(female_unemp_rate, aes(x = Year, y = Female_Unemployment_Rate)) +
  geom_line() +
  labs(
    title = "Female Unemployment Rate in the UK (1971–2020)",
    x = "Year",
    y = "Unemployment Rate (%)"
  ) +
  theme_minimal()

comparison_2019_2020 <- female_unemp_rate %>% 
  filter(Year %in% c(2019, 2020))

ggplot(comparison_2019_2020, aes(x = factor(Year), y = Female_Unemployment_Rate)) +
  geom_col() +
  labs(
    title = "Female Unemployment Rate: 2019 vs 2020",
    x = "Year",
    y = "Unemployment Rate (%)"
  ) +
  theme_minimal()

# Hypothesis Test 1: Proportion test ----------------------------

unemp_2019 <- 698
unemp_2020 <- 713
labour_2019 <- 16000000
labour_2020 <- 16500000

prop.test(
  x = c(unemp_2019, unemp_2020),
  n = c(labour_2019, labour_2020)
)

# Hypothesis Test 2: Gender comparison ----------------------------

gender_data <- inner_join(
  female_unemp_rate,
  male_unemp_rate,
  by = "Year"
)

t.test(gender_data$Female_Unemployment_Rate,
       gender_data$Male_Unemployment_Rate)
