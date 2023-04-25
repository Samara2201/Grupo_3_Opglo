const express = require('express');
const router = express.Router();

// Controller
const productsController = require('../controllers/productsController');

// Formulario de registro

router.get('/carrodecompras', productsController.carrodecompras);


module.exports = router;
