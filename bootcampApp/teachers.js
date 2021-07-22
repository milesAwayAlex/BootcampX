require('dotenv').config();
const { Pool } = require('pg');

const user = process.env.PG_USER;
const password = process.env.PG_PASS;
const host = process.env.PG_HOST;
const database = process.env.PG_DB;

const args = process.argv.slice(2);
args[0] = `%${args[0]}%`;

const pool = new Pool({
  user,
  password,
  host,
  database,
});

pool
  .query(
    `SELECT teachers.name as teacher,
    cohorts.name as cohort
  FROM assistance_requests
    JOIN teachers ON teachers.id = teacher_id
    JOIN students ON students.id = student_id
    JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name LIKE $1
  GROUP BY teachers.name,
    cohorts.name
  ORDER BY teachers.name;`,
    [...args]
  )
  .then((res) => {
    console.log(res.rows);
  })
  .catch((err) => {
    console.log(err);
  })
  .finally(() => {
    pool.end();
  });
