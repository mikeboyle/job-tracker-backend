const db = require('../db');

const getAllJobs = async () => {
  const applications = await db.any('SELECT * FROM jobs_joined;');
  return applications;
};

const getJobById = async (id) => {
  const application = await db.oneOrNone(
    'SELECT * FROM jobs_joined WHERE id = $1',
    [id]
  );
  return application;
};

module.exports = {
  getAllJobs,
  getJobById,
};
