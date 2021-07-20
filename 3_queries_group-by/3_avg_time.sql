SELECT name,
  AVG(assignment_submissions.duration) AS avg_dur
FROM students
  JOIN assignment_submissions ON students.id = student_id
WHERE end_date IS NULL
GROUP BY name
ORDER BY avg_dur DESC;