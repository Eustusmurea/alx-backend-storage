-- Select the band name, the year it was formed, and the lifespan of the band
SELECT 
    band_name,
    YEAR(date_formed) AS formed_year, 
    YEAR(SUBSTRING_INDEX(lifespan, '-')[2]) - YEAR(SUBSTRING _INDEX(lifespan, '–')[1]) AS lifespan  -- Changed '-' to '–' for consistency
FROM metal_bands
WHERE main_style = 'Glam Rock'
ORDER BY 
    lifespan DESC;
