# Week 1 - Data modeling

## Create a table definition for the Snow_survey table that is maximally expressive

Please consider:

- the data types of columns (pick from TEXT, REAL, INTEGER, DATE for this exercise)
- if the table has a primary key and what it might be
- any foreign key(s)
- whether NULL values are allowed
- uniqueness constraints, on individual columns and across columns
- other column value constraints, again, on individual columns and across columns


```{sql}
CREATE TABLE Snow_survey (
    PRIMARY KEY (Site, Date, Plot),
    Site TEXT NOT NULL, CHECK (LENGTH(Site) = 4),
        FOREIGN KEY (Site) REFERENCES Sites(Code),
    Year INTEGER NOT NULL,
    Date DATE NOT NULL,
    Plot TEXT NOT NULL,
    Location TEXT,
    Snow_cover REAL CHECK (Snow_cover >= 0 AND Snow_cover <= 100),
    Water_cover REAL CHECK (Water_cover >= 0 AND Water_cover <= 100),
    Land_cover REAL CHECK (Land_cover >= 0 AND Land_cover <= 100),
    Total_cover REAL NOT NULL CHECK (Total_cover = Snow_cover + Water_cover + Land_cover AND Total_cover = 100),
    Observer TEXT NOT NULL,
        FOREIGN KEY (Personnel) REFERENCES Personnel(Abbreviation),
    Notes TEXT,
);
```


### The table definition includes:
1. Site: Four-letter code of site at which data were collected
2. Year: Year in which data were collected
3. Date: Date on which data were collected
4. Plot: Name of study plot on which survey was conducted
5. Location: Name of dedicated snow-survey location, if applicable
6. Snow_cover: Percent cover of snow, including slush
7. Water_cover: Percent cover of water
8. Land_cover: Percent cover of exposed land
9. Total_cover: Total sum (to check the above percents; should always sum to 100)
10. Observer: Person who conducted the survey
11. Notes: Any relevant comments on the survey

### Reflection

1. Site
- A foreign key to the sites table. The code is checked to have a length of 4. Null values are not allowed.
2. Year
- An interger in which null values are not allowed. The year is important to know when the survey was conducted.
3. Date
- A date in which null values are not allowed. The date is important to know when the survey was conducted.
4. Plot
- A text field in which null values are not allowed. The survey is not helpful without plot information.
5. Location
- Voluntary text field to provide extra information about location of the survey. Null values are allowed.
6. Snow_cover
- Percent cover of snow. Check constraints are added to make sure the value is between 0 and 100, but can be null. Though it is important to know the snow cover, it is not always possible to measure it.
7. Water_cover
- Percent cover of water. Check constraints are added to make sure the value is between 0 and 100, but can be null. Though it is important to know the water cover, it is not always possible to measure it.
8. Land_cover
- Percent cover of land. Check constraints are added to make sure the value is between 0 and 100, but can be null. Though it is important to know the land cover, it is not always possible to measure it.
9. Total_cover
- Total cover of snow, water, and land. Check constriants to ensure the three values sum to 100. This cannot be null, as it is important to know the total cover to ensure the survey was conducted correctly.
10. Observer
- A foreign key to the personnel table. The observer is important to know for possible follow ups. Null values are not allowed.
11. Notes
- Extra imformation about the survey. Null values are allowed. While helpful, it is not always necessary for the survey.
