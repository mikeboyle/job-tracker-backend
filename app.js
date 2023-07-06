const cors = require('cors');
const express = require('express');
const applicationsController = require('./controllers/applicationsController');
const jobsController = require('./controllers/jobsController');
const app = express();

// middleware
app.use(cors());

// controllers
app.use('/applications', applicationsController);
app.use('/jobs', jobsController);

// healthcheck
app.get('/', (request, response) => {
  response.status(200).json({ data: 'Service is running' });
});

module.exports = app;
