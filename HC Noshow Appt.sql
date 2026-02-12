DROP TABLE IF EXISTS HC_Noshow_appt;
CREATE TABLE HC_Noshow_appt
	(
	PatientId varchar (40),
	Appt_ID int PRIMARY KEY,
	Gender varchar (2),
	Schdld_Day date,
	Appt_Day date,
	Age int,
	Neighbourhood varchar (50),
	Scholarship varchar (6),
	Hypertension varchar (6),
	Diabetes varchar (6),
	Alcoholism varchar (6),
	Handicap varchar (6),
	SMS_received varchar (6),
	Showed_up varchar (6),
	Date_diff int
	);

SELECT * FROM HC_Noshow_appt;

--EDA

SELECT
	COUNT (*) AS total_appt
FROM HC_Noshow_appt;

SELECT
	DISTINCT neighbourhood
FROM HC_Noshow_appt;

SELECT
	Gender,
	COUNT (*) AS total_appt
FROM HC_Noshow_appt
GROUP BY 1
ORDER BY 2;

--Overall no show rate

SELECT
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN showed_up = 'FALSE' THEN 1 ELSE 0 END) AS no_shows,
    ROUND(
        100.0 * SUM(CASE WHEN showed_up = 'FALSE' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_percent
FROM HC_Noshow_appt;

--No show rate by day of the week

SELECT
    TO_CHAR(appt_day, 'Day') AS day_of_week,
    COUNT(*) AS total_appts,
    ROUND(
        100.0 * SUM(CASE WHEN showed_up = 'FALSE' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_percent
FROM HC_Noshow_appt
GROUP BY 1
ORDER BY 3 DESC;

--Monthly no-show trend

SELECT
    EXTRACT (MONTH FROM appt_day) AS month,
    COUNT(*) AS total_appts,
    ROUND(
        100.0 * SUM(CASE WHEN showed_up = 'FALSE' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_percent
FROM HC_noshow_appt
GROUP BY 1
ORDER BY 1;

--No-show rate by gender

SELECT
    gender,
    COUNT(*) AS total_appts,
    ROUND(
        100.0 * SUM(CASE WHEN showed_up = 'FALSE' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_percent
FROM HC_noshow_appt
GROUP BY 1;

--No-show rate by age group

SELECT
    CASE
        WHEN age < 18 THEN 'Child'
        WHEN age BETWEEN 18 AND 35 THEN 'Young Adult'
        WHEN age BETWEEN 36 AND 60 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group,
    COUNT(*) AS total_appts,
    ROUND(
        100.0 * SUM(CASE WHEN showed_up = 'FALSE' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_percent
FROM HC_noshow_appt
GROUP BY 1
ORDER BY 3 DESC;

--Scholarship impact on attendance

SELECT
    scholarship,
    COUNT(*) AS total_appts,
    ROUND(
        100.0 * SUM(CASE WHEN showed_up = 'FALSE' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_percent
FROM HC_noshow_appt
GROUP BY 1;

--No-show rate by waiting days

SELECT
    date_diff AS waiting_days,
    COUNT(*) AS total_appts,
    ROUND(
        100.0 * SUM(CASE WHEN showed_up = 'FALSE' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_percent
FROM HC_noshow_appt
GROUP BY 1
ORDER BY 3;

--Categorized waiting time impact

SELECT
    CASE
        WHEN appt_day - schdld_day = 0 THEN 'Same Day'
		WHEN appt_day - schdld_day = 1 THEN 'Next day'
        WHEN appt_day - schdld_day BETWEEN 2 AND 7 THEN '2–7 Days'
        WHEN appt_day - schdld_day BETWEEN 8 AND 30 THEN '8–30 Days'
        ELSE '30+ Days'
    END AS waiting_category,
    COUNT(*) AS total_appts,
    ROUND(
        100.0 * SUM(CASE WHEN showed_up = 'FALSE' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_percent
FROM HC_noshow_appt
GROUP BY 1
ORDER BY 3 DESC;

--SMS vs attendance

SELECT
    sms_received,
    COUNT(*) AS total_appts,
    ROUND(
        100.0 * SUM(CASE WHEN showed_up = 'FALSE' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_percent
FROM HC_noshow_appt
GROUP BY 1;

--SMS effectiveness by age group

SELECT
    CASE
        WHEN age < 18 THEN 'Child'
        WHEN age BETWEEN 18 AND 35 THEN 'Young Adult'
        WHEN age BETWEEN 36 AND 60 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group,
    sms_received,
    ROUND(
        100.0 * SUM(CASE WHEN showed_up = 'FALSE' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_percent
FROM HC_noshow_appt
GROUP BY 1, 2
ORDER BY 1, 2;

--SMS effectiveness by gender

SELECT
    Gender,
    sms_received,
    ROUND(
        100.0 * SUM(CASE WHEN showed_up = 'FALSE' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_percent
FROM HC_noshow_appt
GROUP BY 1, 2
ORDER BY 1, 2;

--Hypertension and no-show

SELECT
    hypertension,
    COUNT(*) AS total_appointments,
    ROUND(
        100.0 * SUM(CASE WHEN showed_up = 'FALSE' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_percent
FROM HC_noshow_appt
GROUP BY 1;

--Diabetes and no-show

SELECT
    diabetes,
    COUNT(*) AS total_appointments,
    ROUND(
        100.0 * SUM(CASE WHEN showed_up = 'FALSE' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_percent
FROM HC_noshow_appt
GROUP BY 1;

--No-show rate by neighborhood

SELECT
    neighbourhood,
    COUNT(*) AS total_appts,
    ROUND(
        100.0 * SUM(CASE WHEN showed_up = 'FALSE' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS no_show_rate_percent
FROM HC_noshow_appt
GROUP BY neighbourhood
HAVING COUNT(*) > 100
ORDER BY no_show_rate_percent DESC;

--Patients with multiple no-shows

SELECT
    patientid,
    COUNT(*) AS missed_appts
FROM HC_noshow_appt
WHERE showed_up = 'FALSE'
GROUP BY patientid
HAVING COUNT(*) > 1
ORDER BY missed_appts DESC;

--Percentage of patients that are habitual no shows?

WITH patient_no_show_counts AS (
    SELECT
        patientid,
        COUNT(*) FILTER (WHERE showed_up = 'FALSE') AS no_show_count
    FROM HC_noshow_appt
    GROUP BY patientid
)

SELECT
    COUNT(*) AS total_patients,
    COUNT(CASE WHEN no_show_count >= 2 THEN 1 END) AS habitual_no_show_patients,
    ROUND(
        100.0 * COUNT(CASE WHEN no_show_count >= 2 THEN 1 END) / COUNT(*),
        2
    ) AS habitual_no_show_percentage
FROM patient_no_show_counts;
