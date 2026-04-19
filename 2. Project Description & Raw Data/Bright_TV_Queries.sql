--- Show all columns - User Information
SELECT * FROM `workspace`.`default`.`bright_tv_` limit 100;


--- Show all columns - Viewership
SELECT * FROM workspace.default.viewership_bright_tv;


--- Check NULL values in columns: IS NULL 
SELECT *
FROM workspace.default.bright_tv_
WHERE age IS NULL;

SELECT * 
FROM workspace.default.viewership_bright_tv
WHERE UserID0 IS NULL;

SELECT * 
FROM workspace.default.viewership_bright_tv
WHERE userid4 IS NULL;

--- Check NULL values in columns: IS NULL 
SELECT *
FROM workspace.default.viewership_bright_tv
WHERE channel2 IS NULL;


--- IS NOT NULL 
SELECT *
FROM workspace.default.bright_tv_
WHERE age IS NOT NULL;


--- Replace NULL values with Zero 
SELECT age,
IFNULL(age, 0) AS age
FROM workspace.default.bright_tv_;


--- SELECT types of races - 7 Types : Black, Indian, White,Coloured, Othwr, Indian Asian, Null
SELECT DISTINCT race
FROM workspace.default.bright_tv_;


--- SELECT different ages 
SELECT DISTINCT age 
FROM workspace.default.bright_tv_;



--- Group Ages : Between 0-18 , 19-30, 31-50, 51+ 
SELECT *,
    CASE
        WHEN age IS NULL THEN 'Unknown'
        WHEN age BETWEEN 1 AND 18 THEN 'Young'
        WHEN age BETWEEN 19 AND 30 THEN 'Young Adult'
        WHEN age BETWEEN 31 AND 50 THEN 'Adult'
        WHEN age > 50 THEN 'Oldies'
    END AS age_group
FROM workspace.default.bright_tv_;

--- Counting of each age groups 
SELECT 
    age_group,
    COUNT(*) AS total_viewership
FROM (
    SELECT *,
        CASE
            WHEN age IS NULL THEN 'Unknown'
            WHEN age BETWEEN 1 AND 18 THEN 'Young'
            WHEN age BETWEEN 19 AND 30 THEN 'Young Adult'
            WHEN age BETWEEN 31 AND 50 THEN 'Adult'
            WHEN age > 50 THEN 'Oldies'
        END AS age_group
    FROM workspace.default.bright_tv_
)
GROUP BY age_group
ORDER BY total_viewership DESC;

--- DAYNAME, MONTHNAME
SELECT RecordDate2,
    dayname(RecordDate2) AS day_name,
    monthname(RecordDate2) AS month_name
FROM workspace.default.viewership_bright_tv;


--- Viewership by Month
SELECT 
    MONTHNAME(RecordDate2) AS month_name,
    COUNT(*) AS total_viewership
FROM workspace.default.viewership_bright_tv
GROUP BY MONTHNAME(RecordDate2)
ORDER BY total_viewership asc;



--- Time Slots Buckets - Morning, Afternoon, Evening , Midnight 
SELECT 
    RecordDate2,
    CASE 
        WHEN date_format(RecordDate2, 'HH:mm:ss') BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN date_format(RecordDate2, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
         WHEN date_format(RecordDate2, 'HH:mm:ss') BETWEEN '17:00:00' AND '23:59:59' THEN 'Evening'
        ELSE 'Midnight'
    END AS Time_Buckets
FROM workspace.default.viewership_bright_tv;

--- Counting Viewers per time bucket 
SELECT
    Time_Buckets,
    COUNT(*) AS Number_of_Viewers
FROM (
    SELECT 
        CASE 
            WHEN date_format(RecordDate2, 'HH:mm:ss') BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
            WHEN date_format(RecordDate2, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
            WHEN date_format(RecordDate2, 'HH:mm:ss') BETWEEN '17:00:00' AND '23:59:59' THEN 'Evening'
            ELSE 'Midnight'
        END AS Time_Buckets
    FROM workspace.default.viewership_bright_tv
) 
GROUP BY Time_Buckets
ORDER BY Number_of_Viewers DESC;

--- Province Buckets 
SELECT 
    province,

    CASE 
        WHEN province IN ('Gauteng', 'Free State', 'North West') THEN 'Central'
        WHEN province IN ('Western Cape', 'Northern Cape') THEN 'Western'
        WHEN province IN ('Kwazulu Natal', 'Eastern Cape') THEN 'Eastern'
        WHEN province IN ('Limpopo', 'Mpumalanga') THEN 'Northern'
        ELSE 'Unknown'
    END AS province_bucket

FROM workspace.default.bright_tv_;


--- Race Buckets 
SELECT 
    race,
    CASE 
        WHEN race IN ('black', 'african') THEN 'Black'
        WHEN race IN ('white') THEN 'White'
        WHEN race IN ('coloured') THEN 'Coloured'
        WHEN race IN ('indian', 'asian') THEN 'Indian/Asian'
        ELSE 'Other/Unknown'
    END AS race_bucket

FROM workspace.default.bright_tv_;


--- Showing Columns in order to join tables 
DESCRIBE workspace.default.viewership_bright_tv;

DESCRIBE workspace.default.bright_tv_;


--- JOIN Tables 
SELECT 
    v.*,
    b.*
FROM workspace.default.viewership_bright_tv v
FULL OUTER JOIN workspace.default.bright_tv_ b
    ON v.UserID0 = b.UserID;


-- COUNT RECORDS IN COMBINED TABLE

SELECT 
    COUNT(*) AS Total_Combined_Rows,
    COUNT(v.UserID0) AS Viewership_Count,
    COUNT(b.UserID) AS BrightTV_Count
FROM workspace.default.viewership_bright_tv v
FULL OUTER JOIN workspace.default.bright_tv_ b
    ON v.UserID0 = b.UserID;


-- REPLACE NULL VALUES AFTER JOIN

SELECT
    COALESCE(v.UserID0, b.UserID) AS UserID,
    b.Gender,
    b.Race,
    b.Age,
    b.Province,
    v.Channel2,
    v.RecordDate2
FROM workspace.default.viewership_bright_tv v
FULL OUTER JOIN workspace.default.bright_tv_ b
    ON v.UserID0 = b.UserID;

--- Viewership per province 
SELECT 
    province,
    COUNT(*) AS total_viewership
FROM workspace.default.bright_tv_
GROUP BY province
ORDER BY total_viewership DESC;

--- Viewership per channel - Top 5

SELECT 
    Channel2,
    COUNT(*) AS total_viewership
FROM workspace.default.viewership_bright_tv
GROUP BY Channel2
ORDER BY total_viewership DESC
LIMIT 5;

--- Viewership per gender 
SELECT 
    Gender,
    COUNT(*) AS total_viewership
FROM workspace.default.bright_tv_
GROUP BY Gender
ORDER BY total_viewership DESC;

---COALESCE Function 

SELECT 
    COALESCE(gender, 'Unknown') AS gender,
    COUNT(*) AS total_viewership
FROM workspace.default.bright_tv_
GROUP BY COALESCE(gender, 'Unknown')
ORDER BY total_viewership DESC;

--- Number of Viewers per hour of the day 
SELECT
    hour(RecordDate2) AS Hour_of_Day,
    COUNT(*) AS Number_of_Viewers
FROM workspace.default.viewership_bright_tv
GROUP BY hour(RecordDate2)
ORDER BY Hour_of_Day;

--- Number of Viewers per day of the week 
SELECT
    date_format(RecordDate2, 'EEEE') AS Day_of_Week,
    COUNT(*) AS Number_of_Viewers
FROM workspace.default.viewership_bright_tv
GROUP BY date_format(RecordDate2, 'EEEE')
ORDER BY Number_of_Viewers DESC;
