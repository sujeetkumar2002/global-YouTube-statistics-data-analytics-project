create database gys;
use gys;

CREATE TABLE channels (
    channel_rank INT NOT NULL,
    youtuber VARCHAR(255) NOT NULL,
    subscribers INT NOT NULL,
    video_views DOUBLE NOT NULL,
    category VARCHAR(255),
    title VARCHAR(255) NOT NULL,
    uploads INT NOT NULL,
    country VARCHAR(255),
    abbreviation VARCHAR(10),
    channel_type VARCHAR(255),
    video_views_rank DOUBLE,
    country_rank DOUBLE,
    channel_type_rank DOUBLE,
    video_views_for_the_last_30_days DOUBLE,
    lowest_monthly_earnings DOUBLE NOT NULL,
    highest_monthly_earnings DOUBLE NOT NULL,
    lowest_yearly_earnings DOUBLE NOT NULL,
    highest_yearly_earnings DOUBLE NOT NULL,
    subscribers_for_last_30_days DOUBLE,
    created_year INT,
    created_month VARCHAR(10),
    created_date DOUBLE,
    gross_tertiary_education_enrollment DOUBLE,
    population DOUBLE,
    unemployment_rate DOUBLE,
    urban_population DOUBLE,
    latitude DOUBLE,
    longitude DOUBLE,
    PRIMARY KEY (channel_rank)
);
SET SQL_SAFE_UPDATES = 1;

-- Start the transaction
START TRANSACTION;

-- Delete rows where created_year is 1970
DELETE FROM channels
WHERE created_year = 1970;

-- Commit the transaction if everything is fine
COMMIT;

-- Verify deletion
SELECT * FROM channels
WHERE created_year = 1970;

SET SQL_SAFE_UPDATES = 0;

SELECT  distinct  created_year FROM channels ;

#1)Total Subscribers by Country
SELECT country, SUM(subscribers) AS total_subscribers
FROM channels
GROUP BY country
ORDER BY total_subscribers DESC;

#2)Total Video Views by Category
SELECT category, SUM(video_views) AS total_video_views
FROM channels
GROUP BY category
ORDER BY total_video_views DESC;

#3)Top 10 Youtubers by Subscribers
SELECT youtuber, subscribers
FROM channels
ORDER BY subscribers DESC
LIMIT 10;

#4)Average Subscribers and Video Views by Country
SELECT country, AVG(subscribers) AS avg_subscribers, AVG(video_views) AS avg_video_views
FROM channels
GROUP BY country;

#5)Category-wise Subscribers and Video Views
SELECT category, SUM(subscribers) AS total_subscribers, SUM(video_views) AS total_video_views
FROM channels
GROUP BY category
ORDER BY total_subscribers DESC;

#6)Total Earnings by Country
SELECT country, SUM(highest_monthly_earnings) AS total_earnings
FROM channels
GROUP BY country
ORDER BY total_earnings DESC;

#7)Average Monthly Earnings by Category
SELECT category, AVG(highest_monthly_earnings) AS avg_monthly_earnings
FROM channels
GROUP BY category
ORDER BY avg_monthly_earnings DESC;

#8)Growth Trend of Subscribers Over Time (by Year)
SELECT created_year, SUM(subscribers) AS total_subscribers
FROM channels
GROUP BY created_year
ORDER BY created_year;

#9)Channels Distribution by Category
SELECT category, COUNT(*) AS channel_count
FROM channels
GROUP BY category
ORDER BY channel_count DESC;

#10)Channels Distribution by Country
SELECT country, COUNT(*) AS channel_count
FROM channels
GROUP BY country
ORDER BY channel_count DESC;





