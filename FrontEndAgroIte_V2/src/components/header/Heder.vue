<template>    
   <div>
     <div class="main-top">
        <div class="container-fluid">
            <div class="row">
                <div class=" float-right col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="right-phone-box">
                        <p>Llamenos :- <a href="#"> +54 920 830 727</a></p>
                    </div>
                    <div class="our-link">
                        <ul>
                            <li>  <router-link to="/registro" class="nav-link">Registrarse</router-link></li>
                            <li>  <router-link v-if="Etiqueta_Iniciar" to="/login" class="nav-link">Iniciar sesion</router-link></li>
                            <li>  <a href="#" v-if="Etiqueta_Salir"  @click="Salir"><i class="fas fa-sign-out s_color"></i> Salir</a></li>
                            <li>  <a href="#" v-if="Etiqueta_Usuario"  @click="Pefril"><i class="fas fa-sign-out s_color"></i> {{user}}</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <header class="main-header">       
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">              
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa fa-bars"></i>
                    </button>          
                    <router-link to="/" class="nav-link"><img src="../../assets/logo.png" class="logo" alt=""></router-link>
                </div>             
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><router-link to="/" class="nav-link">Inicio</router-link></li>
                        <li class="nav-item">   <router-link to="/nosotros" class="nav-link">Nosotros</router-link></li>
                        <li class="dropdown">   
                            <router-link to="/nosotros" class="nav-link">Tienda</router-link>
                            <ul class="dropdown-menu">
                                <li><a href="#">Sidebar Shop</a></li>
                                <li><a href="#">Shop Detail</a></li>
                                <li><a href="#">Cart</a></li>
                                <li><a href="#">Checkout</a></li>
                                <li><a href="#">My Account</a></li>
                                <li><a href="#">Wishlist</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#">Galería</a></li>
                        <li class="nav-item"><a class="nav-link" href="#"> Contáctenos</a></li>
                    </ul>
                </div>              
                <div class="attr-nav">
                    <ul>
                        <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                        <li class="side-menu">
                            <a href="#">
                                <i class="fa fa-shopping-bag"></i>
                                <span class="badge">3</span>
                                <p>My Cart</p>
                            </a>
                        </li>
                    </ul>
                </div>               
            </div>
        </nav>     
    </header>
    </div>
</template>

<script>
import decode from "jwt-decode";
import Vue from 'vue';

Vue.prototype.$eventHub = new Vue();
export default {
    components: {},
    data() {
    return {
      cartValue: 0,
      estadoEtiqeuta:true,
      etiquetasalir:false,
      loguerAgricultor:false,
      user:'',
      datosUsuario:'',
      Token:'',
    };
  },
   //computed: mapState(["cartProducts", "loggedUser"]),
     created() {
       if (this.$session.exists()) {
            this.estadoEtiqeuta=false;
            this.etiquetasalir=true;
            let dataa = {etiquetaSalir:true,etiquetaIniciar:false,etiquetaNombre:true}
            this.$store.commit('EstadoLogueado', dataa);
           
           
       }else{
           this.estadoEtiqeuta=true;
            window.localStorage.clear();
       }
       this.$eventHub.$on('Ocultar', this.Ocultar);
    },
    mounted() {
             if (localStorage.token) this.Token = localStorage.token;
             var datosUsuario = decode(this.Token);   
             this.user = datosUsuario.Nombre;
    },
     computed: {
         Etiqueta_Salir() {            
            return this.$store.state.etiquetaSalir;    
         },
         Etiqueta_Iniciar() {            
            return this.$store.state.etiquetaIniciar;    
         },
         Etiqueta_Usuario() {            
            return this.$store.state.etiquetaNombre;    
         },
    },
    methods: {  

        getLocalProducts() {
        const products = JSON.parse(localStorage.getItem("iki-cart"));
         if (products) {
            this.SET_CART_PRODUCTS(products);
         }
        },
        Pefril(){
              this.$router.push({name:"menu"});  
        },
        isLogged() {
        //  return isLoggedIn();
        },
        Salir(){       
            this.estadoEtiqeuta=true;
            this.etiquetasalir=false;
            this.loguerAgricultor=false
            this.$router.push({name:"login"});
            window.localStorage.clear();
            this.$session.destroy()    

            let data = {etiquetaSalir:false,etiquetaIniciar:true,etiquetaNombre:false}
            this.$store.commit('EstadoNoLogueado', data);
        
        },
        Nosotros(){     
            this.$router.push({name:"nosotros "});
        },
        loc_logout() {
            localStorage.removeItem("_auth");
            this.$router.push("/");
            location.reload();
        },
        Ocultar(){
            this.estadoEtiqeuta=false;
            this.etiquetasalir=true;
            this.loguerAgricultor=true;
           // alert("llega we")
        },
   },
 
}
</script>



<style lang="css">
@import "../../../node_modules/bootstrap/dist/css/bootstrap.min.css";





 body {
     color: #666666;
     font-size: 15px;
     font-family: 'Dosis', sans-serif;
     line-height: 1.80857;
}
 a {
     color: #1f1f1f;
     text-decoration: none !important;
     outline: none !important;
     -webkit-transition: all .3s ease-in-out;
     -moz-transition: all .3s ease-in-out;
     -ms-transition: all .3s ease-in-out;
     -o-transition: all .3s ease-in-out;
     transition: all .3s ease-in-out;
}
 h1, h2, h3, h4, h5, h6 {
     letter-spacing: 0;
     font-weight: normal;
     position: relative;
     padding: 0 0 10px 0;
     font-weight: normal;
     line-height: 120% !important;
     color: #1f1f1f;
     margin: 0 
}


 h1 {
     font-size: 24px 
}
 h2 {
     font-size: 22px 
}
 h3 {
     font-size: 18px 
}
 h4 {
     font-size: 16px 
}
 h5 {
     font-size: 14px 
}
 h6 {
     font-size: 13px 
}
 h1 a, h2 a, h3 a, h4 a, h5 a, h6 a {
     color: #212121;
     text-decoration: none!important;
     opacity: 1 
}
 h1 a:hover, h2 a:hover, h3 a:hover, h4 a:hover, h5 a:hover, h6 a:hover {
     opacity: .8 
}
 a {
     color: #1f1f1f;
     text-decoration: none;
     outline: none;
}
 a, .btn {
     text-decoration: none !important;
     outline: none !important;
     -webkit-transition: all .3s ease-in-out;
     -moz-transition: all .3s ease-in-out;
     -ms-transition: all .3s ease-in-out;
     -o-transition: all .3s ease-in-out;
     transition: all .3s ease-in-out;
}
 .btn-custom {
     margin-top: 20px;
     background-color: transparent !important;
     border: 2px solid #ddd;
     padding: 12px 40px;
     font-size: 16px;
}
 .lead {
     font-size: 18px;
     line-height: 30px;
     color: #767676;
     margin: 0;
     padding: 0;
}
 blockquote {
     margin: 20px 0 20px;
     padding: 30px;
}
 ul, li, ol{
     list-style: none;
     margin: 0px;
     padding: 0px;
}
 button:focus{
     outline: none;
     box-shadow: none;
}
 :focus {
     outline: 0;
}
 p{
     margin: 0px;
}
 .bootstrap-select .dropdown-toggle:focus{
     outline: none !important;
}
 .form-control::-moz-placeholder {
     color: #ffffff;
     opacity: 1;
}
 .bootstrap-select .dropdown-toggle:focus{
     box-shadow: none !important 
}

 #back-to-top {
     position: fixed;
     bottom: 40px;
     right: 40px;
     z-index: 9999;
     width: 32px;
     height: 32px;
     text-align: center;
     line-height: 5px;
     background: #b0b435;
     color: #ffffff;
     cursor: pointer;
     border: 0;
     border-radius: 0px;
     text-decoration: none;
     transition: opacity 0.2s ease-out;
     font-size: 28px;
}


 .main-top{
     background: #000000;
     padding: 10px 0px;
}
 .custom-select-box{
     float: left;
     width: 95px;
     margin-right: 10px;
}
.custom-select-box .form-control{
     background: none;
     border: none;
}
 .custom-select-box .bootstrap-select .btn-light{
     padding: 4px;
     font-size: 14px;
     background: #b0b435;
     color: #fff;
     border: none;
     border-radius: 0px;
}
 .custom-select-box .bootstrap-select .btn-light span{
     padding: 2px;
     line-height: 15px;
}
 .dropdown-toggle::after{
     margin-left: -24px;
}
 .custom-select-box .dropdown-toggle::after {
     display: inline-block;
     width: 0;
     height: 0;
     margin-left: .255em;
     vertical-align: .255em;
     content: "";
     border-top: .3em solid;
     border-right: .3em solid transparent;
     border-bottom: 0;
     border-left: .3em solid transparent;
     position: absolute;
     top: 13px;
     right: 10px;
}
 .bootstrap-select.btn-group .dropdown-toggle .filter-option{
     overflow: inherit;
}
 .bootstrap-select.btn-group .dropdown-menu{
     border: none;
     padding: 0px;
     border-radius: 0px;
}
 .right-phone-box{
     float: left;
     margin-right: 10px;
}


 .right-phone-box p{
     margin: 0px;
     color: #ffffff;
     font-size: 14px;
     line-height: 30px;
}
 .right-phone-box p a{
     color: #ffffff;
}
 .right-phone-box p a:hover{
     color: #b0b435;
}
 .offer-box,.slide {
     color: #FFFFFF;
     font-size: 13px;
     padding: 2px 15px;
     font-family: 'Poppins', sans-serif;
}
 .offer-box li {
     font-weight: 600;
}
 .offer-box li i{
     margin-right: 15px;
     color: #b0b435;
     font-size: 20px;
}





 .our-link{
     float: left;
}
 .our-link ul li{
     display: inline-block;
     border-right: 1px solid #ffffff;
     padding: 0px 10px;
     line-height: 14px;
}
 .our-link ul{
     line-height: 30px;
}
 .our-link ul li a{
     color: #ffffff;
     font-weight: 700;
     text-transform: uppercase;
     font-size: 14px;
}
 .our-link ul li a:hover{
     color: #b0b435;
}
 .our-link ul li:last-child{
     border: none;
}
.login-box{
    float: right;
    width: 120px;
    margin-left: 20px;
}



.login-box .form-control{
     background: none;
     border: none;
}
 .login-box .bootstrap-select .btn-light{
     padding: 4px;
     font-size: 14px;
     background: #b0b435;
     color: #fff;
     border: none;
     border-radius: 0px;
}
 .login-box .bootstrap-select .btn-light span{
     padding: 2px;
     line-height: 15px;
}
.login-box .dropdown-toggle::after {
     display: inline-block;
     width: 0;
     height: 0;
     margin-left: .255em;
     vertical-align: .255em;
     content: "";
     border-top: .3em solid;
     border-right: .3em solid transparent;
     border-bottom: 0;
     border-left: .3em solid transparent;
     position: absolute;
     top: 13px;
     right: 10px;
}


.login-box .dropdown-item{
	padding: 5px 10px;
}

.bootstrap-select.btn-group .dropdown-menu a.dropdown-item span.dropdown-item-inner span.text{
	font-size: 13px;
}


 .search a{
     color: #b0b435;
}
 .attr-nav > ul > li > a:hover{
     color: #b0b435;
}
 nav.navbar.bootsnav ul.nav > li > a{
     margin: 0px;
}



 .attr-nav > ul > li > a{
     padding: 28px 15px;
}
 ul.cart-list > li.total > .btn{
     border-bottom: solid 1px #cfcfcf !important;
     color: #000000 ;
     padding: 10px 15px;
     border: none;
     font-weight: 700;
     color: #ffffff;
}
 @media (min-width: 1024px) {
    /* Navbar General ------*/
     nav.navbar ul.nav > li > a{
         padding: 30px 15px;
         font-weight: 600;
    }
     nav.navbar .navbar-brand{
         margin-top: 0;
    }
     nav.navbar .navbar-brand{
         margin-top: 0;
    }
     nav.navbar li.dropdown ul.dropdown-menu{
         border-top: solid 5px;
    }
    /* Navbar Center ------*/
     nav.navbar-center .navbar-brand{
         margin: 0 !important;
    }
    /* Navbar Brand Top ------*/
     nav.navbar-brand-top .navbar-brand{
         margin: 10px !important;
    }
    /* Navbar Full ------*/
     nav.navbar-full .navbar-brand{
         position: relative;
         top: -15px;
    }
    /* Navbar Sidebar ------*/
     nav.navbar-sidebar ul.nav, nav.navbar-sidebar .navbar-brand{
         margin-bottom: 50px;
    }
     nav.navbar-sidebar ul.nav > li > a{
         padding: 10px 15px;
         font-weight: bold;
    }
    /* Navbar Transparent & Fixed ------*/
     nav.navbar.bootsnav.navbar-transparent.white{
         background-color: rgba(255,255,255,0.3);
         border-bottom: solid 1px #bbb;
    }
     nav.navbar.navbar-inverse.bootsnav.navbar-transparent.dark, nav.navbar.bootsnav.navbar-transparent.dark{
         background-color: rgba(0,0,0,0.3);
         border-bottom: solid 1px #555;
    }
     nav.navbar.bootsnav.navbar-transparent.white .attr-nav{
         border-left: solid 1px #bbb;
    }
     nav.navbar.navbar-inverse.bootsnav.navbar-transparent.dark .attr-nav, nav.navbar.bootsnav.navbar-transparent.dark .attr-nav{
         border-left: solid 1px #555;
    }
     nav.navbar.bootsnav.no-background.white .attr-nav > ul > li > a, nav.navbar.bootsnav.navbar-transparent.white .attr-nav > ul > li > a, nav.navbar.bootsnav.navbar-transparent.white ul.nav > li > a, nav.navbar.bootsnav.no-background.white ul.nav > li > a{
         color: #fff;
    }
     nav.navbar.bootsnav.navbar-transparent.dark .attr-nav > ul > li > a, nav.navbar.bootsnav.navbar-transparent.dark ul.nav > li > a{
         color: #eee;
    }
}







 @media (max-width: 992px) {
    /* Navbar General ------*/
     nav.navbar .navbar-brand{
         margin-top: 0;
         position: relative;
         top: -2px;
    }
     nav.navbar .navbar-brand img.logo{
         width: 160px;
    }
     .attr-nav > ul > li > a{
         padding: 16px 15px 15px;
    }
    /* Navbar Mobile slide ------*/
     nav.navbar.navbar-mobile ul.nav > li > a{
         padding: 15px 15px;
    }
     nav.navbar.navbar-mobile ul.nav ul.dropdown-menu > li > a{
         padding-right: 15px !important;
         padding-top: 15px !important;
         padding-bottom: 15px !important;
    }
     nav.navbar.navbar-mobile ul.nav ul.dropdown-menu .col-menu .title{
         padding-right: 30px !important;
         padding-top: 13px !important;
         padding-bottom: 13px !important;
    }
     nav.navbar.navbar-mobile ul.nav ul.dropdown-menu .col-menu ul.menu-col li a{
         padding-top: 13px !important;
         padding-bottom: 13px !important;
    }
    /* Navbar Full ------*/
     nav.navbar-full .navbar-brand{
         top: 0;
         padding-top: 10px;
    }
}







 nav.navbar.navbar-inverse{
     background-color: #222;
     border-bottom: solid 1px #303030;
}
 nav.navbar.navbar-inverse ul.cart-list > li.total > .btn{
     border-bottom: solid 1px #222 !important;
}
 nav.navbar.navbar-inverse ul.cart-list > li.total .pull-right{
     color: #fff;
}
 nav.navbar.navbar-inverse.megamenu ul.dropdown-menu.megamenu-content .content ul.menu-col li a, nav.navbar.navbar-inverse ul.nav > li > a{
     color: #eee;
}
 nav.navbar.navbar-inverse ul.nav > li.dropdown > a{
     background-color: #222;
}





 nav.navbar.navbar-inverse li.dropdown ul.dropdown-menu > li > a{
     color: #999;
}
 nav.navbar.navbar-inverse ul.nav .dropdown-menu h1, nav.navbar.navbar-inverse ul.nav .dropdown-menu h2, nav.navbar.navbar-inverse ul.nav .dropdown-menu h3, nav.navbar.navbar-inverse ul.nav .dropdown-menu h4, nav.navbar.navbar-inverse ul.nav .dropdown-menu h5, nav.navbar.navbar-inverse ul.nav .dropdown-menu h6{
     color: #fff;
}
 nav.navbar.navbar-inverse .form-control{
     background-color: #333;
     border-color: #303030;
     color: #fff;
}

 nav.navbar.navbar-inverse .attr-nav > ul > li > a{
     color: #eee;
}
 nav.navbar.navbar-inverse .attr-nav > ul > li.dropdown ul.dropdown-menu{
     background-color: #222;
     border-left: solid 1px #303030;
     border-bottom: solid 1px #303030;
     border-right: solid 1px #303030;
}

 nav.navbar.navbar-inverse ul.cart-list > li{
     border-bottom: solid 1px #303030;
     color: #eee;
}
 nav.navbar.navbar-inverse ul.cart-list > li img{
     border: solid 1px #303030;
}

 nav.navbar.navbar-inverse ul.cart-list > li.total{
     background-color: #333;
}
 nav.navbar.navbar-inverse .share ul > li > a{
     background-color: #555;
}
 nav.navbar.navbar-inverse .dropdown-tabs .tab-menu{
     border-right: solid 1px #303030;
}
 nav.navbar.navbar-inverse .dropdown-tabs .tab-menu > ul > li > a{
     border-bottom: solid 1px #303030;
}
 nav.navbar.navbar-inverse .dropdown-tabs .tab-content{
     border-left: solid 1px #303030;
}
 nav.navbar.navbar-inverse .dropdown-tabs .tab-menu > ul > li > a:hover, nav.navbar.navbar-inverse .dropdown-tabs .tab-menu > ul > li > a:focus, nav.navbar.navbar-inverse .dropdown-tabs .tab-menu > ul > li.active > a{
     background-color: #333 !important;
}


 nav.navbar-inverse.navbar-full ul.nav > li > a{
     border:none;
}
 nav.navbar-inverse.navbar-full .navbar-collapse .wrap-full-menu{
     background-color: #222;
}

 nav.navbar-inverse.navbar-full .navbar-toggle{
     background-color: #222 !important;
     color: #6f6f6f;
}



nav.navbar.bootsnav ul.nav > li > a{
     position: relative;
     font-weight: 700;
     font-size: 16px;
     color: #000000;	
     padding-top: 10px;
     padding-bottom: 10px;
     padding-left: 10px;
     padding-right: 30px;
}





 nav.navbar.bootsnav ul.nav li.active > a{
     color: #b0b435;
}
 nav.navbar.bootsnav ul.nav li.active > a:hover{
     color: #b0b435;
}
 nav.navbar.bootsnav ul.nav li > a:hover{
     color: #b0b435;
}
 nav.navbar.bootsnav ul.nav li.megamenu-fw > a:hover{
     color: #b0b435;
}

 @media (min-width: 1024px) {
     nav.navbar.navbar-inverse ul.nav .dropdown-menu{
         background-color: #222 !important;
         border-left: solid 1px #303030 !important;
         border-bottom: solid 1px #303030 !important;
         border-right: solid 1px #303030 !important;
    }
     nav.navbar.navbar-inverse li.dropdown ul.dropdown-menu > li > a{
         border-bottom: solid 1px #303030;
    }
     nav.navbar.navbar-inverse ul.dropdown-menu.megamenu-content .col-menu{
         border-left: solid 1px #303030;
         border-right: solid 1px #303030;
    }
     nav.navbar.navbar-inverse.navbar-transparent.dark{
         background-color: rgba(0,0,0,0.3);
         border-bottom: solid 1px #999;
    }
     nav.navbar.navbar-inverse.navbar-transparent.dark .attr-nav{
         border-left: solid 1px #999;
    }
     nav.navbar.navbar-inverse.no-background.white .attr-nav > ul > li > a, nav.navbar.navbar-inverse.navbar-transparent.dark .attr-nav > ul > li > a, nav.navbar.navbar-inverse.navbar-transparent.dark ul.nav > li > a, nav.navbar.navbar-inverse.no-background.white ul.nav > li > a{
         color: #fff;
    }
     nav.navbar.navbar-inverse.no-background.dark .attr-nav > ul > li > a, nav.navbar.navbar-inverse.no-background.dark .attr-nav > ul > li > a, nav.navbar.navbar-inverse.no-background.dark ul.nav > li > a, nav.navbar.navbar-inverse.no-background.dark ul.nav > li > a{
         color: #3f3f3f;
    }
}



 @media (max-width: 992px) {
     nav.navbar.navbar-inverse .navbar-toggle{
         color: #eee;
         background-color: #222 !important;
    }
     nav.navbar.navbar-inverse .navbar-nav > li > a{
         border-top: solid 1px #303030;
         border-bottom: solid 1px #303030;
    }
     nav.navbar.navbar-inverse ul.nav li.dropdown ul.dropdown-menu > li > a{
         color: #999;
         border-bottom: solid 1px #303030;
    }
     nav.navbar.navbar-inverse .dropdown .megamenu-content .col-menu .title{
         border-bottom: solid 1px #303030;
         color: #eee;
    }
     nav.navbar.navbar-inverse .dropdown .megamenu-content .col-menu ul > li > a{
         border-bottom: solid 1px #303030;
         color: #999 !important;
    }
     nav.navbar.navbar-inverse .dropdown .megamenu-content .col-menu.on:last-child .title{
         border-bottom: solid 1px #303030;
    }
     nav.navbar.navbar-inverse .dropdown-tabs .tab-menu > ul{
         border-top: solid 1px #303030;
    }
     nav.navbar.navbar-inverse.navbar-mobile .navbar-collapse{
         background-color: #222;
    }
}




 @media (max-width: 767px) {
     nav.navbar.navbar-inverse.navbar-mobile ul.nav{
         border-top: solid 1px #222;
    }
}
 .arrow::before{
     font-family: 'FontAwesome';
     content: "\f0d7";
     margin-left: 5px;
     margin-top: 2px;
     border: none;
     display: inline-block;
     vertical-align: inherit;
     position: absolute;
     right: 10px;
     top: 10px;
}
 
 .dropdown-toggle::after{
     display: none;
}

 
 nav.navbar.bootsnav li.dropdown ul.dropdown-menu{
     left: auto;
}

.custom-select-box .dropdown-item{
	padding: 5px 10px;
}
 
 .cart-list h6 a{
     font-size: 16px;
     font-weight: 700;
}

 .cart-list h6 a:hover{
     color: #b0b435;
}
 ul.cart-list p .price{
     font-weight: normal;
}
.side-menu p{
	display: inline-block;
}
 .col-menu .title{
     font-size: 20px;
     font-weight: 700;
     text-transform: uppercase;
}




</style>
