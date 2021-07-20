SELECT(
    SELECT COUNT(id)
    FROM assignments
  ) - COUNT(assignment_submissions) AS total_incomplete
FROM assignment_submissions
  JOIN students ON student_id = students.id
WHERE students.name = 'Ibrahim Schimmel';