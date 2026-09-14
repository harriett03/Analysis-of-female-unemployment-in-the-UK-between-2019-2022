# Female Unemployment in the UK — Statistical Analysis (1971–2020)

Testing whether female unemployment rose significantly during COVID-19, and whether unemployment outcomes differ by gender, using UK Labour Force Survey data.

## Overview
This project examines UK female unemployment trends from 1971–2020, with a focus on two questions: did female unemployment rise significantly between 2019 and 2020 (the onset of COVID-19), and do male and female unemployment rates differ significantly over time?

## Data Sources
- **Female unemployment rate** — ONS series MGSZ (1971–2020)
- **Female unemployment (thousands)** — ONS series MGTR
- **Male unemployment rate** — ONS series MGSY (supplementary dataset)

All data sourced directly from the UK Office for National Statistics (ONS) Labour Force Survey, seasonally adjusted, monthly frequency.

## Methods
- **Test 1 — Two-sample proportion test:** compared the proportion of unemployed women in 2019 vs. 2020
- **Test 2 — Two-sample t-test:** compared mean unemployment rates between men and women across the full time series

## Key Findings
- **Female unemployment rose significantly from 2019 to 2020** (p < 0.05), rising from 598,000 to 713,000 people (3.6% → 4.3%), consistent with the disproportionate impact of COVID-19 on sectors with high female employment (retail, hospitality, personal services)
- **A statistically significant gender gap** in unemployment rates was found across the time series, consistent with existing labour market research
- Findings are discussed in the context of unpaid care burden, part-time/insecure work concentration, and the "motherhood penalty" affecting women's labour market resilience

## Tools Used
R, tidyverse (dplyr, readr), ggplot2, knitr

## Full Report
See the full write-up for detailed context, descriptive statistics, and discussion of policy implications.
