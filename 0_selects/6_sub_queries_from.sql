SELECT avg(tot_st_tab.total_students) AS avg_students
FROM(
    SELECT COUNT(students) AS total_students
    FROM students
      JOIN cohorts ON cohorts.id = cohort_id
    GROUP BY cohorts.name
  ) AS tot_st_tab