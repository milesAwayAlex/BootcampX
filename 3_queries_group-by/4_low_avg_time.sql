SELECT students.name,
  avg(assignment_submissions.duration) AS avg_dur,
  avg(assignments.duration) AS est_avg_dur
FROM students
  JOIN assignment_submissions ON students.id = student_id
  JOIN assignments ON assignments.id = assignment_id
WHERE end_date IS NULL
GROUP BY students.name
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY avg_dur;