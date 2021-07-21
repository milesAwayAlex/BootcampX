SELECT teachers.name,
  COUNT(assistance_requests.id)
FROM assistance_requests
  JOIN teachers ON teachers.id = teacher_id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;