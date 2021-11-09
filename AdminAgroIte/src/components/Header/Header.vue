<template>
  <b-navbar class="header d-print-none app-header">
    <b-nav>
      <b-nav-item>
        <a class="d-md-down-none px-2" href="#" @click="toggleSidebarMethod" id="barsTooltip">
          <i class='la la-bars la-lg' />
        </a>
        <a class="fs-lg d-lg-none" href="#" @click="switchSidebarMethod">
          <i class="la la-bars la-lg" />
        </a>
        <img src="../../assets/logo/logo.png" width="8%" style=" height: auto"  alt="">
         <div class="site-branding-text d-md-down-none">
            <h5 class="site-title"  style="font-size:1.30vw;" > <strong>  </strong></h5>
            <p class="site-description" style="font-size:1.0vw; color:#808080" > </p>
          </div>

      </b-nav-item>
      
    </b-nav>
  
    <a class="navbarBrand d-md-none" style="font-size:3vw;" >     
      &nbsp;
      {{name}}
      &nbsp;
      </a>
    <b-nav class="ml-auto">  
      <!--   
      <b-nav-item href="#"> 
         <span style="font-size:1.0vw;" >{{NombreUsuario}}</span>       
       </b-nav-item> -->
    <b-nav-item-dropdown
            class="notificationsMenu d-md-down-none mr-2"
            menu-class="notificationsWrapper py-0 animate__animated animate__animated-fast animate__fadeIn"
            right>
            <template slot="button-content">
              <span class="avatar rounded-circle thumb-sm float-left mr-2">
                <img class="rounded-circle" src="../../assets/people/a5.jpg" alt="..." />
              </span>
             <span class="small">{{NombreUsuario}}</span>
              <span class="ml-1 circle bg-primary text-white fw-bold">13</span>
            </template>
            <Notifications />
          </b-nav-item-dropdown>

      <b-nav-item-dropdown id="v-step-2" class="settingsDropdown d-sm-down-none" no-caret right>
        <template slot="button-content">
          <i class="la la-cog px-2" />
        </template>


        <b-dropdown-item><i class="la la-user" /> Mi Cuenta</b-dropdown-item>
        <b-dropdown-divider />
        <b-dropdown-item>Calendar</b-dropdown-item>
       
       
        <b-dropdown-divider />
        <b-dropdown-item-button @click="logout">
          <i class="la la-sign-out" /> Salir
        </b-dropdown-item-button>
      </b-nav-item-dropdown>
    </b-nav>
  </b-navbar>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import firebase from '@/firebase'
import axios from  'axios';
import Notifications from '@/components/Notifications/Notifications';
export default {
  name: 'Header',
  props:['name','ru'],
   data() {
    return {
       NombreUsuario:'',
       Token:''
      
    };
  },
  components: { Notifications },
  computed: {
    ...mapState('layout', ['sidebarClose', 'sidebarStatic']),
  },
   created(){
    firebase.auth().onAuthStateChanged(user =>  {
      if (user) {
        // User is signed in.
       // console.log(user.displayName)
      //  this.NombreUsuario=user.displayName;
        var id = user.uid;
        this.DatosUsuario(id);
      
      } else {       
         console.log("no logueado")
      }
      });
  },
  methods: {

      DatosUsuario(id_usuario){		  
			 let me = this;		          
             axios({
                  method: 'get',
                  url: 'Usuario/ObtenerUsuario/'+id_usuario,                                       
               })
                  .then(response => {
					    console.log(response.data);
					 var ruta ="";
					  me.NombreUsuario=response.data.data.nombre_usuario;
					 				                                    

                  }).catch(function (error) {
                      console.log(error);
            });
	   },
    ...mapActions('layout', ['toggleSidebar', 'switchSidebar', 'changeSidebarActive']),
    switchSidebarMethod() {
      if (!this.sidebarClose) {
        this.switchSidebar(true);
        this.changeSidebarActive(null);
      } else {
        this.switchSidebar(false);
        const paths = this.$route.fullPath.split('/');
        paths.pop();
        this.changeSidebarActive(paths.join('/'));
      }
    },
    toggleSidebarMethod() {
      if (this.sidebarStatic) {
        this.toggleSidebar();
        this.changeSidebarActive(null);
      } else {
        this.toggleSidebar();
        const paths = this.$route.fullPath.split('/');
        paths.pop();
        this.changeSidebarActive(paths.join('/'));
      }
    },
    logout() {
      window.localStorage.setItem('authenticated', false);
      this.$router.push('/login');
    },
  }
};
</script>

<style src="./Header.scss" lang="scss"></style>
