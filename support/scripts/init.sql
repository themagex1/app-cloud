CREATE TABLE IF NOT EXISTS game_sales (
  id int primary key,
  Name varchar not null,
  Platform varchar not null,
  Year varchar not null,
  Genre varchar not null,
  Publisher varchar not null,
  NA_Sales double precision not null,
  EU_Sales double precision not null,
  JP_Sales double precision not null,
  Other_Sales double precision not null,
  Global_Sales double precision not null);
  
COPY game_sales(id,Name,Platform,Year,Genre,Publisher,NA_Sales,EU_Sales,JP_Sales,Other_Sales,Global_Sales)
FROM '/tmp/vgsales.csv'
DELIMITER ','
CSV HEADER; 
