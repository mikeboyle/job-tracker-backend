const db = require('../db');

const getAllApplications = async () => {
  const applications = await db.any('SELECT * FROM applications_joined;');
  return applications;
};

const getApplicationById = async (id) => {
  const application = await db.oneOrNone(
    'SELECT * FROM applications_joined WHERE id = $1',
    [id]
  );
  return application;
};

module.exports = {
  getAllApplications,
  getApplicationById,
};
