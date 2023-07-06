const { Router } = require('express');
const { getAllJobs, getJobById } = require('../queries/jobsQueries');

const jobsController = Router();

jobsController.get('/', async (request, response) => {
  try {
    const jobs = await getAllJobs();
    response.status(200).json({ data: jobs });
  } catch (err) {
    response.status(500).json({ error: err.message });
  }
});

jobsController.get('/:id', async (request, response) => {
  try {
    const { id } = request.params;
    const job = await getJobById(id);
    if (job) {
      response.status(200).json({ data: job });
    } else {
      response.status(404).json({ error: `No job with id ${id}` });
    }
  } catch (err) {
    response.status(500).json({ error: err.message });
  }
});

module.exports = jobsController;
