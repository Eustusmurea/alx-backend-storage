-- select the band name, the year it was formed, and the lifespan of the band
-- select only the bands that are classified as Glam Rock
-- order the result by the lifespan of the band in descending order
SELECT 
    band_name,
    YEAR(date_formed) AS formed_year
    YEAR(SPLIT(lifespan, '–')[2]) - YEAR(SPLIT(lifespan, '-')[1]) AS lifespan
FROM metal_bands
WHERE main_style = 'Glam Rock'
ORDER BY 
    lifespan DESC;
