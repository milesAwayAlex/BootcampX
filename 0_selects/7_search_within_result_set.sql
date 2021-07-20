SELECT assignments.name
FROM assignments
WHERE assignments.id NOT IN (
    SELECT assignment_id
    FROM assignment_submissions
      JOIN students ON students.id = student_id
    WHERE students.name = 'Ibrahim Schimmel'
  );