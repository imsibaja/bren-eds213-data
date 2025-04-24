CREATE TABLE Snow_cover (
    Site VARCHAR NOT NULL,
    Year INTEGER NOT NULL CHECK (Year BETWEEN 1990 AND 2018),
    Date DATE NOT NULL,
    Plot VARCHAR NOT NULL,
    Location VARCHAR NOT NULL,
    Snow_cover REAL CHECK (Snow_cover BETWEEN 0 AND 100),
    Water_cover REAL CHECK (Snow_cover BETWEEN 0 AND 100),
    Land_cover REAL CHECK (Snow_cover BETWEEN 0 AND 100),
    Total_cover REAL CHECK (Snow_cover BETWEEN 0 AND 100),
    Observer VARCHAR,
    Notes VARCHAR,
    PRIMARY KEY(Site, Plot, Location, Date),
    FOREIGN KEY (Site) REFERENCES Site (Code)
    --FOREIGN KEY (observer) REFERENCES Personnel (Abbreviation)
);

COPY Snow_cover FROM "../ASDN_csv/snow_survey_fixed.csv" (header TRUE, nullstr "NA");

SELECT * FROM Snow_cover LIMIT 10;

-- Ask 1: What is the average snow cover at each site?
SELECT Site, AVG(Snow_cover) AS Avg_snow_cover
    FROM Snow_cover
    GROUP BY Site
    ORDER BY Avg_snow_cover DESC;

-- Ask 2: Top most snowy sites
SELECT Site, AVG(Snow_cover) AS Avg_snow_cover
    FROM Snow_cover
    GROUP BY Site
    ORDER BY Avg_snow_cover DESC
    LIMIT 5;

-- Ask 3: Save this as a view
CREATE VIEW Avg_snow_cover AS (
    SELECT Site, AVG(Snow_cover) AS Avg_snow_cover
    FROM Snow_cover
    GROUP BY Site
    ORDER BY Avg_snow_cover DESC
    LIMIT 5
);

SELECT * FROM Avg_snow_cover;

CREATE TEMP TABLE Site_avg_snow_cover AS (
    SELECT Site, AVG(Snow_cover) AS Avg_snow_cover 
    FROM Snow_cover
    GROUP BY Site
    ORDER BY Avg_snow_cover DESC
    LIMIT 5
);

SELECT * FROM Site_avg_snow_cover;


-- DANGER ZONE AKA updating data
-- We found that 0s at Plot = 'brw0' with snow_cover == 0 are actuall y no data (NULL)

CREATE TEMP TABLE Snow_cover_backup AS (Select * FROM Snow_cover);
UPDATE Snow_cover_backup SET Snow_cover = NULL WHERE Plot = 'brw0' AND Snow_cover = 0;
-- 