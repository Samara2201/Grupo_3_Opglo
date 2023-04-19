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
