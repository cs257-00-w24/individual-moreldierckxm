# individual-template
Maxence Morel Dierckx, team c

### Database Setup Answers
1. Given the dataset's straightforward nature, focusing on daily COVID-19 cases and deaths worldwide, a single table is sufficient to represent the data without complicating the schema with unnecessary relational designs. I removed specific columns that were redundant or unnecessary (e.g., `day`, `month`, `year`, `geoId`, and `countryterritoryCode`), aiming for a streamlined dataset that still retained all critical information for analysis. The selection of data types was straightforward, based on the nature of the data in each column: dates were stored as DATE, numeric values (cases, deaths, population) as INTEGER, and text fields (e.g., country names, continents) as VARCHAR to accommodate variable-length strings. No primary keys were are required since there is only one table in our database.

2. Each of my queries represents an audience action;

* **getCasesByRegion and getDeathsByRegion**: These queries aggregate cases or deaths by date for a specified region, directly supporting audience actions aimed at tracking the spread or impact of COVID-19 within specific geographical areas over time. This facilitates comparisons, trend analysis, and the ability to zoom in on specific periods of interest, aligning with goals such as research, public health planning, or even journalistic reporting.

* **getCaseFatalityRatioByRegion**: By calculating the case fatality ratio, this query offers insights into the lethality of the virus in different regions, serving audience members interested in understanding the disease's severity or assessing the effectiveness of healthcare responses.

* **getTopNCountriesByCases and getTopNCountriesByDeaths**: These queries identify the most affected countries within a given timeframe, catering to users seeking to identify hotspots, allocate resources, or implement travel advisories based on the prevalence or mortality of the disease.

* **getDateWithHighestCasesByRegion and getDateWithHighestDeathsByRegion**: Focused on pinpointing peak outbreak days, these queries satisfy the needs of users aiming to analyze the pandemic's dynamics, possibly to evaluate response measures or to prepare for future outbreaks.

* **getDayWithHighestCasesPer100000ByRegion**: Offering a per capita perspective on outbreaks, this query addresses audience actions concerned with understanding the relative impact of COVID-19, adjusting for population differences to facilitate fair comparisons between regions.