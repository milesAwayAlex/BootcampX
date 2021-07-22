require('dotenv').config();
const { Pool } = require('pg');

const user = process.env.PG_USER;
const password = process.env.PG_PASS;
const host = process.env.PG_HOST;
const database = process.env.PG_DB;

const args = process.argv.slice(2);
args[0] = `%${args[0]}%`;
args[1] = args[1] || 5;

const pool = new Pool({
  user,
  password,
  host,
  database,
});

// let globalErr;

/* (async () => {
  const client = await pool.connect();
  try {
    const res = await client.query(
      'SELECT id, name, cohort_id FROM students LIMIT 5',
    );
    console.log(res.rows);
  } finally {
    client.release();
  }
})()
  .catch((err) => console.log(err))
  .finally(async () => {
    await pool.end();
  });
 */
pool
  .query(
    'SELECT students.id as st_id, students.name as st_name, cohorts.name as cohort FROM students join cohorts on cohort_id = cohorts.id where cohorts.name LIKE $1 LIMIT $2',
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
