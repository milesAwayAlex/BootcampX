SELECT DAY,
  COUNT(id),
  sum(duration)
FROM assignments
GROUP BY DAY
ORDER BY DAY;