const express = require('express');
const path = require('path');

const app = express();

const publicPath = path.join(__dirname, 'public');
app.use(express.static(publicPath));

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '/views/home.html'));
});

const port = process.env.PORT || 3000; //se levanta el puerto 
app.listen(port, () => {
    console.log(`Server started on http://localhost:${port}`);

})