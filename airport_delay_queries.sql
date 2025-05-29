SELECT SUM(arr_flights) AS total_flights,
SUM(arr_del15) AS total_delayed_flights
FROM flight_delays

-- -----------------------------

SELECT
airport,
airport_name,
SUM(arr_flights) AS total_flights,
SUM(arr_del15) AS delayed_flights,
ROUND(SUM(arr_del15) * 100.0 / SUM(arr_flights), 2) AS delay_percentage
FROM flight_delays
GROUP BY airport, airport_name
ORDER BY delay_percentage DESC
LIMIT 5;

-- -----------------------------

SELECT
year,
month,
SUM(arr_flights) AS total_flights,
SUM(arr_del15) AS delayed_flights,
ROUND(SUM(arr_del15) * 100.0 / SUM(arr_flights), 2) AS delay_percentage
FROM flight_delays
GROUP BY year, month
ORDER BY year, month;

-- -----------------------------

SELECT
ROUND(SUM(carrier_ct), 0) AS carrier_delays,
ROUND(SUM(weather_ct), 0) AS weather_delays,
ROUND(SUM(nas_ct), 0) AS nas_delays,
ROUND(SUM(security_ct), 0) AS security_delays,
ROUND(SUM(late_aircraft_ct), 0) AS late_aircraft_delays
FROM flight_delays;