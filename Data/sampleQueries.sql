
-- SQL queries corresponding to the methods in api.y

-- getCasesByRegion
SELECT dateRep, SUM(cases) AS total_cases
FROM covid_cases_worldwide
WHERE (continentExp = '{region}' OR countriesAndTerritories = '{region}' OR '{region}' = 'global')
AND dateRep BETWEEN '{start_date}' AND '{end_date}'
GROUP BY dateRep
ORDER BY countriesAndTerritories DESC, dateRep DESC;

-- getDeathsByRegion
SELECT dateRep, SUM(deaths) AS total_deaths
FROM covid_cases_worldwide
WHERE (continentExp = '{region}' OR countriesAndTerritories = '{region}' OR '{region}' = 'global')
AND dateRep BETWEEN '{start_date}' AND '{end_date}'
GROUP BY dateRep
ORDER BY countriesAndTerritories DESC, dateRep DESC;

-- getCaseFatalityRatioByRegion
SELECT dateRep, (SUM(deaths)/SUM(cases)) AS case_fatality_ratio
FROM covid_cases_worldwide
WHERE (continentExp = '{region}' OR countriesAndTerritories = '{region}' OR '{region}' = 'global')
AND dateRep BETWEEN '{start_date}' AND '{end_date}'
GROUP BY dateRep
ORDER BY case_fatality_ratio DESC;

-- getTopNCountriesByCases
SELECT countriesAndTerritories, SUM(cases) AS total_cases
FROM covid_cases_worldwide
WHERE (continentExp = '{region}' OR '{region}' = 'global')
AND dateRep BETWEEN '{start_date}' AND '{end_date}'
GROUP BY countriesAndTerritories
ORDER BY total_cases DESC
LIMIT {n};

-- getTopNCountriesByDeaths
SELECT countriesAndTerritories, SUM(deaths) AS total_deaths
FROM covid_cases_worldwide
WHERE (continentExp = '{region}' OR '{region}' = 'global')
AND dateRep BETWEEN '{start_date}' AND '{end_date}'
GROUP BY countriesAndTerritories
ORDER BY total_deaths DESC
LIMIT {n};

-- getDateWithHighestCasesByRegion
SELECT dateRep, MAX(cases) AS highest_cases
FROM covid_cases_worldwide
WHERE (continentExp = '{region}' OR countriesAndTerritories = '{region}' OR '{region}' = 'global')
AND dateRep BETWEEN '{start_date}' AND '{end_date}'
GROUP BY dateRep
ORDER BY highest_cases DESC
LIMIT 1;

-- getDateWithHighestDeathsByRegion
SELECT dateRep, MAX(deaths) AS highest_deaths
FROM covid_cases_worldwide
WHERE (continentExp = '{region}' OR countriesAndTerritories = '{region}' OR '{region}' = 'global')
AND dateRep BETWEEN '{start_date}' AND '{end_date}'
GROUP BY dateRep
ORDER BY highest_deaths DESC
LIMIT 1;

-- getDayWithHighestCasesPer100000ByRegion
SELECT dateRep, MAX(Cumulative_number_for_14_days_of_COVID-19_cases_per_100000) AS highest_cases_per_100000
FROM covid_cases_worldwide
WHERE (continentExp = '{region}' OR countriesAndTerritories = '{region}' OR '{region}' = 'global')
AND dateRep BETWEEN '{start_date}' AND '{end_date}'
GROUP BY dateRep
ORDER BY highest_cases_per_100000 DESC
LIMIT 1;
