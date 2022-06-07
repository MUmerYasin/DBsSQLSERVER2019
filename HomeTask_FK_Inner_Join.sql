CREATE DATABASE practice
GO

-- CREATE SCHEMA Territory
-- GO

CREATE TABLE Territory.City
(
CityId INT NOT NULL IDENTITY(1,1),
CityName NVARCHAR(60) NOT NULL,
CountryCode NVARCHAR(5),
CONSTRAINT PKyhuj PRIMARY KEY (CityId),
CONSTRAINT FKjuj FOREIGN KEY (CountryCode) REFERENCES Territory.Country(CountryCode)
)
GO

CREATE TABLE Territory.Country
(
CountryCode NVARCHAR(5) NOT NULL CONSTRAINT PK PRIMARY KEY,
CountryName NVARCHAR(50) NOT NULL 

)
GO
 INSERT INTO Territory.Country(CountryCode, CountryName)
 VALUES
 (
    '1' , 'Pakistan'
 ),

 (
    '2', 'India'
 )
 GO


INSERT INTO Territory.City (CityID, CityName, CountryCode)
VALUES
(

    '25','Lahore', '1'
),
(
    '26','Dehli', '2'
)
GO
-- SELECT * FROM Territory.City
-- GO

-- SELECT *
-- FROM Territory.City c
-- INNER JOIN Territory.Country s
-- ON c.CountryCode = s.CountryCode
-- GO

SELECT c.CityId, s.CountryCode
FROM Territory.City c
INNER JOIN Territory.Country s
ON c.CountryCode = s.CountryCode
GO