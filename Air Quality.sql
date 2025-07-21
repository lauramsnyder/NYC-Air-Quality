---What measurements are done the most for air quality in NYC?---

SELECT measure_info,
    name,
    COUNT(unique_id) AS total_measurements
   FROM air_quality
  GROUP BY measure_info, name
  ORDER BY total_measurements DESC;


---What is the top 10 mcg/m3 annual average for each geography type for fine particles?---

SELECT DISTINCT 
    aq.geo_type_name,
    dg.geo_type_name_exp,
    aq.time_period,
    aq.data_value
   FROM air_quality aq
     JOIN dim_geo_type_name dg ON aq.geo_type_name = dg.geo_type_name
  WHERE aq.time_period LIKE 'Annual Average%' AND aq.measure_info = 'mcg/m3' AND aq.measure = 'Mean'
  ORDER BY aq.data_value DESC
 LIMIT 25;


---How many annual measurements were there in the Bronx done for the measure of 'per 100,000 children?---

SELECT count(data_value) AS total_measurements,
    measure_info,
    geo_place_name,
    time_period,
    measure
   FROM air_quality
  WHERE geo_place_name = 'Bronx' AND measure_info = 'per 100,000 children'
  GROUP BY time_period, measure, measure_info, geo_place_name;


---What is the count of air quality measurements done for each Annual Average?---

SELECT time_period,
    COUNT(unique_id) AS total_measurements
   FROM air_quality
  WHERE time_period LIKE 'Annual Average%'
  GROUP BY time_period
  ORDER BY time_period;


---What is the average of the mean mcg/m3 between Winter and Summer? How different are they?

SELECT
        CASE
            WHEN time_period LIKE 'Summer%' THEN 'Summer'
            WHEN time_period LIKE 'Winter%' THEN 'Winter'
            ELSE NULL
        END AS season,
    ROUND(AVG(data_value), 2) AS average_mean
   FROM air_quality
  WHERE (time_period LIKE 'Summer%' OR time_period LIKE 'Winter%') AND measure_info = 'mcg/m3'
  GROUP BY (
        CASE
            WHEN time_period LIKE 'Summer%' THEN 'Summer'
            WHEN time_period LIKE 'Winter%' THEN 'Winter'
            ELSE NULL
        END);


---For the UHF geographical type, how many recorded times were there instances due to asthma hospitalizations per 100,000 children due to Ozone (O3) versus fine particles (PM 2.5)?---

SELECT
        CASE
            WHEN name LIKE '%Ozone%' THEN 'Ozone'
            WHEN name LIKE '%PM2.5%' THEN 'PM2.5'
            ELSE NULL
        END AS reason,
    ROUND(SUM(data_value), 0) AS total_hospitalizations,
    COUNT(data_value) * 100000 AS total_children
   FROM air_quality
  WHERE geo_type_name = 'UHF42' AND measure_info LIKE '%children%' AND (name LIKE '%Ozone%' OR name LIKE '%PM2.5%')
  GROUP BY (
        CASE
            WHEN name LIKE '%Ozone%' THEN 'Ozone'
            WHEN name LIKE '%PM2.5%' THEN 'PM2.5'
            ELSE NULL
        END);


---For each NYC borough, what is the difference in fine particles (PM 2.5) from 2010 to 2023 and the percent change?---

SELECT geo_place_name,
    ROUND(AVG(data_value) 
      FILTER (WHERE time_period = 'Summer 2010'), 2) AS fine_particles_2010,
    ROUND(AVG(data_value) 
      FILTER (WHERE time_period = 'Summer 2023'), 2) AS fine_particles_2023
   FROM air_quality
  WHERE geo_type_name = 'Borough' 
    AND measure_info LIKE '%mcg/m3' 
    AND time_period LIKE '%Summer%' 
    AND 
      (time_period LIKE '%2010' 
        OR time_period LIKE '%2023')
  GROUP BY geo_place_name;
