const express = require('express');
const path = require('path');

//Requerimos main.js los routers
const mainRoutes = require('./routes/main');

const app = express();

// Definir estaticos
const publicPath = path.join(__dirname, 'public');
app.use(express.static(publicPath));

// para indicar a expres que el motor de plantilla voy a usar ejs//
app.set('view engine', 'ejs'); 
app.set('views', path.join(__dirname, 'views'));

app.use('/', mainRoutes);

 //se levanta el puerto 
const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Server started on http://localhost:${port}`);

})