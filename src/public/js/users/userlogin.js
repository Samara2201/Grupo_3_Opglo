 //Ejecutando funciones
document.getElementById("btn__iniciar-sesion").addEventListener("click", iniciarSesion);
document.getElementById("btn__registrarse").addEventListener("click", register);
window.addEventListener("resize", anchoPage);

//Declarando variables
var formulario_login = document.querySelector(".formulario__login");
var formulario_register = document.querySelector(".formulario__register");
var contenedor_login_register = document.querySelector(".contenedor__login-register");
var caja_trasera_login = document.querySelector(".caja__trasera-login");
var caja_trasera_register = document.querySelector(".caja__trasera-register");

    //FUNCIONES

function anchoPage(){

    if (window.innerWidth > 850){
        caja_trasera_register.style.display = "block";
        caja_trasera_login.style.display = "block";
    }else{
        caja_trasera_register.style.display = "block";
        caja_trasera_register.style.opacity = "1";
        caja_trasera_login.style.display = "none";
        formulario_login.style.display = "block";
        contenedor_login_register.style.left = "0px";
        formulario_register.style.display = "none";   
    }
}

anchoPage();


    function iniciarSesion(){
        if (window.innerWidth > 850){
            formulario_login.style.display = "block";
            contenedor_login_register.style.left = "10px";
            formulario_register.style.display = "none";
            caja_trasera_register.style.opacity = "1";
            caja_trasera_login.style.opacity = "0";
        }else{
            formulario_login.style.display = "block";
            contenedor_login_register.style.left = "0px";
            formulario_register.style.display = "none";
            caja_trasera_register.style.display = "block";
            caja_trasera_login.style.display = "none";
        }
    }

    function register(){
        if (window.innerWidth > 850){
            formulario_register.style.display = "block";
            contenedor_login_register.style.left = "410px";
            formulario_login.style.display = "none";
            caja_trasera_register.style.opacity = "0";
            caja_trasera_login.style.opacity = "1";
        }else{
            formulario_register.style.display = "block";
            contenedor_login_register.style.left = "0px";
            formulario_login.style.display = "none";
            caja_trasera_register.style.display = "none";
            caja_trasera_login.style.display = "block";
            caja_trasera_login.style.opacity = "1";
        }
        }

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

