const express = require("express");
const session = require('express-session');
const cookies = require('cookie-parser');
const app = express();
const rutas = require('./routes/main.js');
const rutas_usuarios = require('./routes/users.js');
const rutas_productos = require('./routes/products.js');
const rutas_productcart= require('./routes/productCart')
const cors = require('cors');

const userApiRoutes = require('./api/routes/userApiRouter');
const productApiRoutes = require('./api/routes/productApiRouter');

const path = require('path'); 

const usuarioLogueadoMiddleware = require('./middlewares/usuarioLogueadoMiddleware');
const valoresProductCart = require('./middlewares/productCartMiddlewares');

app.use(session({
	secret: "Shhh, Es un secreto!!!",
	resave: false,
	saveUninitialized: false,
}));

app.use(cookies());  
app.use(cors());  
app.use(usuarioLogueadoMiddleware);  
app.use(valoresProductCart);  

app.use(express.urlencoded({ extended: false }));
app.use(express.json()); 

const methodOverride = require('method-override');
app.use(methodOverride('_method'));

app.use(express.static('public'));
app.set("views engine", "ejs");

app.use('/', rutas);
app.use('/users', rutas_usuarios);
app.use('/products', rutas_productos);
app.use('/productCart', rutas_productcart);


app.use(userApiRoutes);
app.use(productApiRoutes);

const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Server started on http://localhost:${port}`);

})