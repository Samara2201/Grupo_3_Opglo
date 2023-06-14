const express = require('express');
const router = express.Router();
const controlador = require('../controllers/productCartController');

router.get('/productCart', controlador.productCart);
router.post('/addProductCart', controlador.addProductCart);
router.post('/deleteProductCart', controlador.deleteProductCart);
router.get('/informacion', controlador.informacion);
router.get('/pago', controlador.pago);
router.get('/envio', controlador.envio);


module.exports = router;