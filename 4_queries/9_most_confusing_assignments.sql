SELECT assignments.id,
  name,
  DAY,
  chapter,
  COUNT(assistance_requests.id) AS total
FROM assignments
  JOIN assistance_requests ON assignments.id = assignment_id
GROUP BY assignments.id
ORDER BY total DESC;