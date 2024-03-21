-- Select origin column from metal_band table
--count the number of fans for each origin
--order by number of fans in descending order
SELECT origin, COUNT(*) AS nb_fans
FROM metal_band
GROUP BY origin
ORDER BY nb_fans DESC;
