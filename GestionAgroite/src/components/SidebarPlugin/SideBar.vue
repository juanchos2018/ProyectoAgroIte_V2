<template>
  <nav
    class="
      navbar navbar-vertical
      fixed-left
      navbar-expand-md navbar-light
      bg-white
    "
    id="sidenav-main"
  >
    <div class="container-fluid">
      <!--Toggler-->
      <navbar-toggle-button @click.native="showSidebar"> </navbar-toggle-button>
      <router-link class="navbar-brand" to="/">
        <img :src="logo" class="navbar-brand-img" alt="..." />
      </router-link>

      <slot name="mobile-right">
        <ul class="nav align-items-center d-md-none">
          <base-dropdown class="nav-item" menu-on-right tag="li" title-tag="a">
            <a
              slot="title-container"
              class="nav-link nav-link-icon"
              href="#"
              role="button"
              aria-haspopup="true"
              aria-expanded="false"
            >
              <i class="ni ni-bell-55"></i>
            </a>

            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </base-dropdown>
          <base-dropdown class="nav-item" menu-on-right tag="li" title-tag="a">
            <a slot="title-container" class="nav-link" href="#" role="button">
              <div class="media align-items-center">
                <span class="avatar avatar-sm rounded-circle">
                  <img alt="Image placeholder" src="img/theme/team-1.jpg" />
                </span>
              </div>
            </a>

            <div class="dropdown-header noti-title">
              <h6 class="text-overflow m-0">Bienvenido!</h6>
            </div>
            <router-link to="/profile" class="dropdown-item">
              <i class="ni ni-single-02"></i>
              <span>My profile</span>
            </router-link>
            <router-link to="/profile" class="dropdown-item">
              <i class="ni ni-settings-gear-65"></i>
              <span>Settings</span>
            </router-link>
            <router-link to="/profile" class="dropdown-item">
              <i class="ni ni-calendar-grid-58"></i>
              <span>Activity</span>
            </router-link>
            <router-link to="/profile" class="dropdown-item">
              <i class="ni ni-support-16"></i>
              <span>Support</span>
            </router-link>
            <div class="dropdown-divider"></div>
            <a href="#!" class="dropdown-item">
              <i class="ni ni-user-run"></i>
              <span>Salir</span>
            </a>
          </base-dropdown>
        </ul>
      </slot>
      <slot></slot>
      <div
        v-show="$sidebar.showSidebar"
        class="navbar-collapse collapse show"
        id="sidenav-collapse-main"
      >
        <div class="navbar-collapse-header d-md-none">
          <div class="row">
            <div class="col-6 collapse-brand">
              <router-link to="/">
                <img :src="logo" />
              </router-link>
            </div>
            <div class="col-6 collapse-close">
              <navbar-toggle-button
                @click.native="closeSidebar"
              ></navbar-toggle-button>
            </div>
          </div>
        </div>

        <ul class="navbar-nav">
          <slot name="links"> </slot>
        </ul>
        <!--Divider-->
        <hr class="my-3" />
        <!--Heading-->
        <h6 class="navbar-heading text-muted">Usuarios</h6>
        <!--Navigation-->
        <ul class="navbar-nav mb-md-3">
          <li class="nav-item">
            <router-link to="/actividad" class="nav-link">
              <i class="ni ni-spaceship"></i> Actividad
            </router-link>
          </li>
          <li class="nav-item">        

            <router-link to="/usuarios" class="nav-link">
              <i class="ni ni-spaceship"></i> Usuarios
            </router-link>
          </li>
          <li class="nav-item">
            <a
              class="nav-link"
              href="https://www.creative-tim.com/learning-lab/bootstrap-vue/alerts/argon-dashboard"
            >
              <i class="ni ni-ui-04"></i> Asociacion
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">
              <img
                src="public/img/iconos/icons8_buy_30px_2.png"
                width="20"
                height="20"
                style="margin-right: 10px"
              />

              <span class="nav-link-text">Agricultores</span>
            </a>
          </li>
        </ul>
        <!--Divider-->
        <hr class="my-3" />
        <!--Heading-->
        <h6 class="navbar-heading text-muted">Productos</h6>
        <!--Navigation-->
        <ul class="navbar-nav mb-md-3">
          <li class="nav-item">
            <router-link to="/categorias" class="nav-link">
              <i class="ni ni-spaceship"></i> Categoria
            </router-link>
          </li>
          <li class="nav-item">
            
             <router-link to="/frecuencialist" class="nav-link">
              <i class="ni ni-spaceship"></i> Frecuencia
            </router-link>
          </li>
          <li class="nav-item">
            <a
              class="nav-link"
              href="https://www.creative-tim.com/learning-lab/bootstrap-vue/alerts/argon-dashboard"
            >
              <i class="ni ni-ui-04"></i> Unidad de Medida
            </a>
          </li>
          <li class="nav-item">
           
              <router-link to="/productolist" class="nav-link">
              <i class="ni ni-spaceship"></i> Producto
            </router-link>
          </li>
        </ul>
        <hr class="my-3" />
        <!--Heading-->
        <h6 class="navbar-heading text-muted">Trasporte</h6>
        <!--Navigation-->
        <ul class="navbar-nav mb-md-3">
          <li class="nav-item">
            <a
              class="nav-link"
              href="https://www.creative-tim.com/learning-lab/bootstrap-vue/alerts/argon-dashboard"
            >
              <i class="ni ni-spaceship"></i> Transportista
            </a>
          </li>
          <li class="nav-item">
            <a
              class="nav-link"
              href="https://www.creative-tim.com/learning-lab/bootstrap-vue/colors/argon-dashboard"
            >
              <i class="ni ni-palette"></i> Vehiculo
            </a>
          </li>
        </ul>
        <hr class="my-3" />
        <!--Heading-->
        <h6 class="navbar-heading text-muted">Compras</h6>
        <!--Navigation-->
        <ul class="navbar-nav mb-md-3">
          <li class="nav-item">
            <a
              class="nav-link"
              href="https://www.creative-tim.com/learning-lab/bootstrap-vue/alerts/argon-dashboard"
            >
              <i class=""></i> Pagos
            </a>
          </li>
          <li class="nav-item">
            <a
              class="nav-link"
              href="https://www.creative-tim.com/learning-lab/bootstrap-vue/colors/argon-dashboard"
            >
              <i class="ni ni-palette"></i> Pedidos
            </a>
          </li>
          <li class="nav-item">
            <a
              class="nav-link"
              href="https://www.creative-tim.com/learning-lab/bootstrap-vue/colors/argon-dashboard"
            >
              <i class="ni ni-palette"></i> Entrega
            </a>
          </li>
          <li class="nav-item">
            <a
              class="nav-link"
              href="https://www.creative-tim.com/learning-lab/bootstrap-vue/colors/argon-dashboard"
            >
              <i class="ni ni-palette"></i> Ubicacion
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>
<script>
import NavbarToggleButton from "@/components/NavbarToggleButton";

export default {
  name: "sidebar",
  components: {
    NavbarToggleButton,
  },
  props: {
    logo: {
      type: String,
      default: "img/brand/logo.png",
      description: "Sidebar app logo",
    },
    autoClose: {
      type: Boolean,
      default: true,
      description:
        "Whether sidebar should autoclose on mobile when clicking an item",
    },
  },
  provide() {
    return {
      autoClose: this.autoClose,
    };
  },
  methods: {
    closeSidebar() {
      this.$sidebar.displaySidebar(false);
    },
    showSidebar() {
      this.$sidebar.displaySidebar(true);
    },
    Salir(){
        window.localStorage.clear();
        this.$session.destroy()  
        this.$router.push({name:"login"});
          //  let data = {etiquetaSalir:false,etiquetaIniciar:true,etiquetaNombre:false}
           // this.$store.commit('EstadoNoLogueado', data);
    }
  },
  beforeDestroy() {
    if (this.$sidebar.showSidebar) {
      this.$sidebar.showSidebar = false;
    }
  },
};
</script>
