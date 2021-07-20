SELECT cohorts.name,
  COUNT(assignment_submissions.id) AS totalSubmissions
FROM cohorts
  JOIN students ON cohort_id = cohorts.id
  JOIN assignment_submissions ON student_id = students.id
GROUP BY cohorts.name
ORDER BY totalSubmissions DESC;