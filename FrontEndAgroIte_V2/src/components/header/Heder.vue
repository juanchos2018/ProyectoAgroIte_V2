<template>
  <div>
    <div class="main-top">
      <div class="container-fluid">
        <div class="row">
          <div class="float-right col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="right-phone-box">
              <p>Llamenos :- <a href="#"> +54 920 830 727</a></p>
            </div>
            <div class="our-link">
              <ul>
                <li>
                  <router-link to="/registro" class="nav-link"
                    >Registrarse</router-link
                  >
                </li>
                <li>
                  <router-link
                    v-if="Etiqueta_Iniciar"
                    to="/login"
                    class="nav-link"
                    >Iniciar sesion</router-link
                  >
                </li>
                <li>
                  <a href="#" v-if="Etiqueta_Salir" @click="Salir"
                    ><i class="fas fa-sign-out s_color"></i> Salir</a
                  >
                </li>
                <li>
                  <a href="#" v-if="Etiqueta_Usuario" @click="Pefril"
                    ><i class="fas fa-sign-out s_color"></i>
                    {{ Nombre_Usuario }}</a
                  >
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <header class="main-header">
      <nav
        class="
          navbar navbar-expand-lg navbar-light
          bg-light
          navbar-default
          bootsnav
        "
      >
        <div class="container">
          <div class="navbar-header">
            <button
              class="navbar-toggler"
              type="button"
              data-toggle="collapse"
              data-target="#navbar-menu"
              aria-controls="navbars-rs-food"
              aria-expanded="false"
              aria-label="Toggle navigation"
            >
              <i class="fa fa-bars"></i>
            </button>
            <router-link to="/" class="nav-link"
              ><img src="../../assets/logo.png" class="logo" alt=""
            /></router-link>
          </div>
          <div class="collapse navbar-collapse" id="navbar-menu">
            <ul
              class="nav navbar-nav ml-auto"
              data-in="fadeInDown"
              data-out="fadeOutUp"
            >
              <li class="nav-item active">
                <router-link to="/" class="nav-link">Inicio</router-link>
              </li>
              <li class="nav-item">
                <router-link to="/nosotros" class="nav-link"
                  >Nosotros</router-link
                >
              </li>
              <li class="dropdown"></li>

              <li class="nav-item">
                <router-link to="/galeria" class="nav-link"
                  >Galería</router-link
                >
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#"> Contáctenos</a>
              </li>
            </ul>
          </div>
          <div class="attr-nav">
            <ul>
              <li class="side-menu">
                <a @click="VerCArrito">
                  <i class="fa fa-shopping-bag"></i>
                  <span class="badge">3</span>
                  <p>Carrito</p>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <vue-drawer :visible.sync="visible">
      <div class="drawebackgro" slot="header">
        <h4 class="carrito">Mi Carrito</h4>
      </div>

      <div slot="body">
          
        <div class="cart-widget-content pb-0">
          <div class="side">
            <ul class="cart-list">
              <li v-for="item in carrito" :key="item.key" class="cart-box">
                <div class="itemCarrito">
                  <a href="#" class="product-image">
                    <img
                      :src="url_base + item.photo"
                      class="img_car"
                      width="50"
                    />
                  </a>
                  <div class="product-content">
                    <a class="product-link" href="#">{{ item.Descripcion }}</a>
                    <div class="cart-collateral">
                      <span class="qty-cart">{{ item.quantity }}</span
                      ><span> x </span
                      ><span class="product-price-amount"
                        ><span class="currency-sign">S/ </span
                        >{{ parseFloat(item.unit_price).toFixed(2) }}</span
                      >
                    </div>
                  </div>
                  <div>
                    <a
                      href="#"
                      data-row="edf4e384c8436c8fc1eef8b48a960158"
                      @click="DeleteItemCar(item.id_product)"
                      class="product-remove product_remove_sidebar"
                      style="margin-left: 2px"
                      ><i class="fa fa-times-circle" aria-hidden="true"></i
                    ></a>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>

        
          <p>{{TotalCompra}}</p>
      </div>
    </vue-drawer>
  </div>
</template>

<script>
import decode from "jwt-decode";
import Vue from "vue";
import { mapState } from "vuex";

Vue.prototype.$eventHub = new Vue();
export default {
  components: {},
  data() {
    return {
      cartValue: 0,
      estadoEtiqeuta: true,
      etiquetasalir: false,
      loguerAgricultor: false,
      user: "",
      datosUsuario: "",
      Token: "",
      visible: false,
      TotalPagar: 0,
      CantidadTotal: 0,
      url_base: "https://localhost:44357/",
    };
  },
  //computed: mapState(["cartProducts", "loggedUser"]),
  created() {
    if (this.$session.exists()) {
      this.estadoEtiqeuta = false;
      this.etiquetasalir = true;
      let dataa = {
        etiquetaSalir: true,
        etiquetaIniciar: false,
        etiquetaNombre: true,
      };
      this.$store.commit("EstadoLogueado", dataa);
    } else {
      this.estadoEtiqeuta = true;
      window.localStorage.clear();
    }
    this.$eventHub.$on("Ocultar", this.Ocultar);
  },
  mounted() {
    if (localStorage.token) this.Token = localStorage.token;
    var datosUsuario = decode(this.Token);
    this.user = datosUsuario.Nombre;
  },
  computed: {
    ...mapState(["carrito", "canttotal", "total", "search_product"]),

    Etiqueta_Salir() {
      return this.$store.state.etiquetaSalir;
    },
    Etiqueta_Iniciar() {
      return this.$store.state.etiquetaIniciar;
    },
    Etiqueta_Usuario() {
      return this.$store.state.etiquetaNombre;
    },
    Nombre_Usuario() {
      return this.$store.state.nombreUsuario.sub;
    },
    TotalCompra(){
        return   this.carrito.reduce((acc, item) => acc + parseInt(item.total_price), 0);
    }
  },
  methods: {
    Pefril() {
      this.$router.push({ name: "menu" });
    },
    isLogged() {
      //  return isLoggedIn();
    },
    Salir() {
      this.estadoEtiqeuta = true;
      this.etiquetasalir = false;
      this.loguerAgricultor = false;
      this.$router.push({ name: "login" });
      window.localStorage.clear();
      this.$session.destroy();

      let data = {
        etiquetaSalir: false,
        etiquetaIniciar: true,
        etiquetaNombre: false,
      };
      this.$store.commit("EstadoNoLogueado", data);
    },
    Nosotros() {
      this.$router.push({ name: "nosotros " });
    },
    loc_logout() {
      localStorage.removeItem("_auth");
      this.$router.push("/");
      location.reload();
    },
    Ocultar() {
      this.estadoEtiqeuta = false;
      this.etiquetasalir = true;
      this.loguerAgricultor = true;
      // alert("llega we")
    },
    VerCArrito() {
      this.visible = true;
    },
    DeleteItemCar(id) {
      let data = { id_product: id };
      this.$store.commit("deletItemCart", data);
      this.$store.commit("cantTotal", "1");
      this.$store.commit("total", "1");
    },
  },
};
</script>

<style lang="css">
@import "../../../node_modules/bootstrap/dist/css/bootstrap.min.css";
ul {
  display: block;
  list-style-type: disc;
  margin-block-start: 1em;
  margin-block-end: 1em;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
  padding-inline-start: 40px;
}

.itemCarrito {
  display: flex;
}

.product-image-gallery .product-gallery-item img {
  width: 100%;
}

.img_car {
  margin-right: 7px;
}
</style>
