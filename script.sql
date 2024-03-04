SELECT
  ARRAY_TO_STRING([state_abbreviation, name], '-') AS airport_info
FROM (
  SELECT
    state_abbreviation,
    name,
    ROW_NUMBER() OVER (PARTITION BY state_abbreviation ORDER BY elevation DESC) AS rn
  FROM `bigquery-public-data.faa.us_airports`
)
WHERE
  rn = 1;