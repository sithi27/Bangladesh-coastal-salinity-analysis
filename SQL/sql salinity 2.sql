-- ============================================================
--  Bangladesh Coastal Salinity Analysis
--  Database: salinity_health_db
--  Source: FAO Report AC352E (Tables XIV, XV, XVIII)
-- ============================================================

USE salinity_health_db;

-- ────────────────────────────────────────
-- CREATE MEASUREMENT TABLE
-- ────────────────────────────────────────
CREATE TABLE IF NOT EXISTS salinity_measurements (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    year        VARCHAR(10),
    district    VARCHAR(50),
    river       VARCHAR(100),
    station     VARCHAR(50),
    stage       VARCHAR(10),   -- HWS or LWS
    item        VARCHAR(10),   -- Max, Mean, Min
    apr         FLOAT, may FLOAT, jun FLOAT,
    jul         FLOAT, aug FLOAT, sep FLOAT,
    oct         FLOAT, nov FLOAT, dec_ FLOAT,
    jan         FLOAT, feb FLOAT, mar FLOAT
);
SHOW TABLES;
-- ────────────────────────────────────────
-- INSERT DATA — KHULNA (Table XIV)
-- ────────────────────────────────────────
INSERT INTO salinity_measurements (year,district,river,station,stage,item,apr,may,jun,jul,aug,sep,oct,nov,dec_,jan,feb,mar) VALUES
('1976-77','Khulna','Rupsa-Pasur','Khulna','HWS','Mean',10420,9877,1312,235,249,280,253,279,320,403,771,2125),
('1976-77','Khulna','Rupsa-Pasur','Khulna','LWS','Mean',8600,7544,775,273,243,271,236,277,317,395,497,1288),
('1977-78','Khulna','Rupsa-Pasur','Khulna','HWS','Mean',2794,576,348,223,210,NULL,220,260,305,351,386,374),
('1977-78','Khulna','Rupsa-Pasur','Khulna','LWS','Mean',1321,369,275,208,215,NULL,230,260,303,352,377,363),
('1978-79','Khulna','Rupsa-Pasur','Khulna','HWS','Mean',412,387,252,NULL,NULL,NULL,311,388,378,435,485,NULL),
('1978-79','Khulna','Rupsa-Pasur','Khulna','LWS','Mean',316,288,242,NULL,NULL,NULL,257,343,374,426,443,NULL),
('1979-80','Khulna','Rupsa-Pasur','Khulna','HWS','Mean',712,693,441,NULL,NULL,NULL,337,418,856,2507,NULL,NULL),
('1979-80','Khulna','Rupsa-Pasur','Khulna','LWS','Mean',528,532,378,NULL,NULL,NULL,335,398,644,1785,NULL,NULL);

-- ────────────────────────────────────────
-- INSERT DATA — BAGERHAT (Table XV)
-- ────────────────────────────────────────
INSERT INTO salinity_measurements (year,district,river,station,stage,item,apr,may,jun,jul,aug,sep,oct,nov,dec_,jan,feb,mar) VALUES
('1976-77','Bagerhat','Alaipur-Daratana','Bagerhat','HWS','Mean',7950,7681,6072,NULL,NULL,NULL,NULL,622,9954,1670,3573,6065),
('1976-77','Bagerhat','Alaipur-Daratana','Bagerhat','LWS','Mean',7693,7732,6065,NULL,NULL,NULL,NULL,581,932,1531,2209,6039),
('1977-78','Bagerhat','Alaipur-Daratana','Bagerhat','HWS','Mean',9353,3515,2430,713,572,638,NULL,567,629,870,1847,3837),
('1977-78','Bagerhat','Alaipur-Daratana','Bagerhat','LWS','Mean',8010,4553,2507,383,569,620,NULL,547,604,825,1837,3913),
('1978-79','Bagerhat','Alaipur-Daratana','Bagerhat','HWS','Mean',6083,6417,4250,NULL,NULL,NULL,NULL,NULL,695,922,2379,6006),
('1978-79','Bagerhat','Alaipur-Daratana','Bagerhat','LWS','Mean',6110,6400,4250,NULL,NULL,NULL,NULL,NULL,735,852,2182,5140),
('1979-80','Bagerhat','Alaipur-Daratana','Bagerhat','HWS','Mean',10118,4598,4216,NULL,NULL,NULL,760,1075,2070,4344,8166,NULL),
('1979-80','Bagerhat','Alaipur-Daratana','Bagerhat','LWS','Mean',9977,4525,3983,NULL,NULL,NULL,703,615,1940,3885,7632,NULL);

-- ────────────────────────────────────────
-- INSERT DATA — SATKHIRA (Table XVIII)
-- ────────────────────────────────────────
INSERT INTO salinity_measurements (year,district,river,station,stage,item,apr,may,jun,jul,aug,sep,oct,nov,dec_,jan,feb,mar) VALUES
('1976-77','Satkhira','Ichamati','Satkhira','HWS','Mean',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10407,13100,19493,NULL),
('1976-77','Satkhira','Ichamati','Satkhira','LWS','Mean',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7980,12780,17274,NULL),
('1977-78','Satkhira','Ichamati','Satkhira','HWS','Mean',20743,27161,17348,657,700,NULL,647,NULL,NULL,NULL,NULL,9050),
('1977-78','Satkhira','Ichamati','Satkhira','LWS','Mean',21133,26908,15907,820,697,NULL,600,NULL,NULL,NULL,NULL,9625),
('1978-79','Satkhira','Ichamati','Satkhira','HWS','Mean',21700,24625,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('1978-79','Satkhira','Ichamati','Satkhira','LWS','Mean',20200,23250,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
('1979-80','Satkhira','Ichamati','Satkhira','HWS','Mean',7667,8000,NULL,NULL,NULL,NULL,15125,NULL,NULL,NULL,NULL,NULL),
('1979-80','Satkhira','Ichamati','Satkhira','LWS','Mean',7667,7250,NULL,NULL,NULL,NULL,13875,NULL,NULL,NULL,NULL,NULL);

-- ────────────────────────────────────────
-- ANALYSIS QUERIES
-- ────────────────────────────────────────

-- 1. All data overview
SELECT year, district, river, stage, item FROM salinity_measurements ORDER BY district, year;

-- 2. Average annual mean salinity by district
SELECT
    district,
    ROUND(AVG((COALESCE(apr,0)+COALESCE(may,0)+COALESCE(jun,0)+
               COALESCE(jul,0)+COALESCE(aug,0)+COALESCE(sep,0)+
               COALESCE(oct,0)+COALESCE(nov,0)+COALESCE(dec_,0)+
               COALESCE(jan,0)+COALESCE(feb,0)+COALESCE(mar,0)) /
              (NULLIF((apr IS NOT NULL)+(may IS NOT NULL)+(jun IS NOT NULL)+
               (jul IS NOT NULL)+(aug IS NOT NULL)+(sep IS NOT NULL)+
               (oct IS NOT NULL)+(nov IS NOT NULL)+(dec_ IS NOT NULL)+
               (jan IS NOT NULL)+(feb IS NOT NULL)+(mar IS NOT NULL), 0))), 0
    ) AS avg_annual_ec
FROM salinity_measurements
WHERE item = 'Mean'
GROUP BY district
ORDER BY avg_annual_ec DESC;

-- 3. Which district has highest salinity?
SELECT district, river,
    GREATEST(
        COALESCE(apr,0), COALESCE(may,0), COALESCE(jun,0),
        COALESCE(jul,0), COALESCE(aug,0), COALESCE(sep,0),
        COALESCE(oct,0), COALESCE(nov,0), COALESCE(dec_,0),
        COALESCE(jan,0), COALESCE(feb,0), COALESCE(mar,0)
    ) AS peak_ec_recorded
FROM salinity_measurements
WHERE item = 'Max'
ORDER BY peak_ec_recorded DESC
LIMIT 5;

-- 4. Dry season (Nov-Mar) vs Monsoon (Jun-Sep) comparison
SELECT district,
    ROUND(AVG((COALESCE(nov,0)+COALESCE(dec_,0)+COALESCE(jan,0)+
               COALESCE(feb,0)+COALESCE(mar,0))/5), 0) AS dry_season_avg,
    ROUND(AVG((COALESCE(jun,0)+COALESCE(jul,0)+
               COALESCE(aug,0)+COALESCE(sep,0))/4), 0) AS monsoon_avg
FROM salinity_measurements
WHERE item = 'Mean'
GROUP BY district;

-- 5. HWS vs LWS comparison by district
SELECT district, stage,
    ROUND(AVG(COALESCE(apr,0)+COALESCE(may,0)+COALESCE(mar,0))/3, 0) AS peak_season_avg
FROM salinity_measurements
WHERE item = 'Mean'
GROUP BY district, stage
ORDER BY district, stage;

-- 6. JOIN with station metadata
SELECT
    s.district,
    s.Station,
    s.River,
    s.Upazila,
    m.year,
    m.stage,
    ROUND((COALESCE(m.jan,0)+COALESCE(m.feb,0)+COALESCE(m.mar,0))/3, 0) AS peak_qtr_avg_ec
FROM salinity_data s
JOIN salinity_measurements m ON s.District = m.district
WHERE m.item = 'Mean'
ORDER BY peak_qtr_avg_ec DESC
LIMIT 10;
