// Rutas accesibles 
app.get('/', (req, res) => {
  res.send('Página de inicio');
});

app.get('/acerca-de', (req, res) => {
  res.send('Página de acerca de nosotros');
});

// Rutas accesibles solo sin login
app.get('/registro', (req, res) => {
  if (req.user) {
    res.redirect('/perfil');
  } else {
    res.send('Página de registro');
  }
});

app.get('/iniciar-sesion', (req, res) => {
  if (req.user) {
    res.redirect('/perfil');
  } else {
    res.send('Página de inicio de sesión');
  }
});

// Rutas accesibles solo con login
app.get('/perfil', (req, res) => {
  if (req.user) {
    res.send(`Bienvenido, ${req.user.nombre}`);
  } else {
    res.redirect('/iniciar-sesion');
  }
});

app.get('/configuracion', (req, res) => {
  if (req.user) {
    res.send('Página de configuración');
  } else {
    res.redirect('/iniciar-sesion');
  }
});

// Verificación de autenticación
app.get('/mi-cuenta', (req, res) => {
  if (req.user) {
    res.send('Página de mi cuenta');
  } else {
    res.redirect('/iniciar-sesion');
  }
});

