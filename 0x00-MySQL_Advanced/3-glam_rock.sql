-- Select the band name, the year it was formed, and the lifespan of the band
SELECT band_name, (IFNULL(split, 2022) - formed) AS lifespan, 
FROM metal_bands
WHERE style LIKE '%glam rock%'
ORDER BY lifespan DESC;
