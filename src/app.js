const express = require('express');
const session = require('express-session'); 
const cookies = require('cookie-parser');
const path = require('path');

const userLoggedMiddleware = require('./middlewares/userLoggedMiddleware'); // middleware de applicación 

//Requerimos main.js los routers
const mainRoutes = require('./routes/main');
const UserRoutes = require('./routes/userRoutes');
const productsRoutes = require('./routes/productsRoutes');

const app = express();

app.use(session({  
	secret: "Shhh, It's a secret",
	resave: false,
	saveUninitialized: false,
}));

app.use(cookies());

app.use(userLoggedMiddleware);

app.use(express.urlencoded({ extended: false }));

// Definir estaticos
const publicPath = path.join(__dirname, 'public');
app.use(express.static(publicPath));

// para indicar a expres que el motor de plantilla voy a usar ejs//
app.set('view engine', 'ejs'); 
app.set('views', path.join(__dirname, 'views'));

app.use('/', mainRoutes);
app.use('/user', UserRoutes);
app.use('/user', productsRoutes);


 //se levanta el puerto 
const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Server started on http://localhost:${port}`);

})