SELECT students.name AS stName,
  students.start_date AS stStart,
  cohorts.name AS chName,
  cohorts.start_date AS chStart
FROM students
  JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.start_date != students.start_date
ORDER BY chStart;