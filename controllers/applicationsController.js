const { Router } = require('express');
const {
  getAllApplications,
  getApplicationById,
} = require('../queries/applicationsQueries');

const applicationsController = Router();

applicationsController.get('/', async (request, response) => {
  try {
    const applications = await getAllApplications();
    response.status(200).json({ data: applications });
  } catch (err) {
    response.status(500).json({ error: err.message });
  }
});

applicationsController.get('/:id', async (request, response) => {
  try {
    const { id } = request.params;
    const application = await getApplicationById(id);
    if (application) {
      response.status(200).json({ data: application });
    } else {
      response.status(404).json({ error: `No application with id ${id}` });
    }
  } catch (err) {
    response.status(500).json({ error: err.message });
  }
});

module.exports = applicationsController;
