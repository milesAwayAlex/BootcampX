SELECT name AS student,
  COUNT(assignment_submissions.id) AS totalSub
FROM assignment_submissions
  JOIN students ON students.id = student_id
WHERE end_date IS NULL
GROUP BY name
HAVING COUNT(assignment_submissions.id) < 100;