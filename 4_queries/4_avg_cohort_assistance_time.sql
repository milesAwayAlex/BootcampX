SELECT cohorts.name,
  avg(completed_at - started_at) AS avg_dur
FROM assistance_requests
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY avg_dur;