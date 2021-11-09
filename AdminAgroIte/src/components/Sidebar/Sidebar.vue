<template>
  <div class="sidebar-wrapper">
    <nav
        :class="{sidebar: true, sidebarStatic, sidebarOpened}"
        @mouseenter="sidebarMouseEnter"
        @mouseleave="sidebarMouseLeave"
    >
      <header class="logo">
         <img src="../../assets/logo/logo.png" width="50%" alt=""><br>       
         
      </header>

       <hr class="my-3">
       <ul class="navbar-nav">
    
        <NavLink
            :activeItem="activeItem"
            header="Inicio"
            link="/app/inicio"
            iconName="flaticon-home"
            index="inicio"
            isHeader
        />
       
         <NavLink
            
            header="Actividad"
            link="/app/actividadlist"
            iconName="flaticon-home"
            index="actividad"
            isHeader
          /> 
        <NavLink
           
            header="Usuarios"
            
            link="/app/usuariolist"
            iconName="flaticon-home"
            index="usurio"
            isHeader
          /> 

          <NavLink
           
            header="Asociacion"
            link="/app/asociacionlist"
            iconName="flaticon-home"
            index="Asociacion"
            isHeader
          /> 


        <NavLink
          
            header="Categoria"
            link="/app/categorialist"
            iconName="flaticon-home"
            index="Categoria"
            isHeader
          /> 

     <NavLink
           
            header="Frecuencia"
            link="/app/frecuencialist"
            iconName="flaticon-home"
            index="Frecuencia"
            isHeader
          /> 

         <NavLink
            :activeItem="activeItem"
            header="Unidad de volumen"
            link="/app/unidadvolumenlist"
            iconName="flaticon-home"
            index="publicaciones"
            isHeader
          /> 
          <NavLink
            :activeItem="activeItem"
            header="Productos"
            link="/app/productolist"
            iconName="flaticon-home"
            index="taxistas"
            isHeader
          />
          <NavLink
            :activeItem="activeItem"
            header="Vehiculo"
            link="/app/taxistas"
            iconName="flaticon-home"
            index="taxistas"
            isHeader
          />
          <NavLink
            :activeItem="activeItem"
            header="Trasportista"
            link="/app/taxistas"
            iconName="flaticon-home"
            index="taxistas"
            isHeader
          />
          <NavLink
            :activeItem="activeItem"
            header="Compra"
            link="/app/taxistas"
            iconName="flaticon-home"
            index="taxistas"
            isHeader
          />
           <NavLink
            :activeItem="activeItem"
            header="Pagos"
            link="/app/taxistas"
            iconName="flaticon-home"
            index="taxistas"
            isHeader
          />
          <NavLink
            :activeItem="activeItem"
            header="Pedidos"
            link="/app/taxistas"
            iconName="flaticon-home"
            index="taxistas"
            isHeader
          />
          <NavLink
            :activeItem="activeItem"
            header="Entrega"
            link="/app/taxistas"
            iconName="flaticon-home"
            index="taxistas"
            isHeader
          />
          <NavLink
            :activeItem="activeItem"
            header="Ubicacion"
            link="/app/taxistas"
            iconName="flaticon-home"
            index="taxistas"
            isHeader
          />

    
      </ul>
      
    </nav>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import isScreen from '@/core/screenHelper';
import NavLink from './NavLink/NavLink';

export default {
  name: 'Sidebar',
  components: { NavLink },
  data() {
    return {
     
    }
  },
  methods: {
    ...mapActions('layout', ['changeSidebarActive', 'switchSidebar']),
    setActiveByRoute() {
      const paths = this.$route.fullPath.split('/');
      paths.pop();
      this.changeSidebarActive(paths.join('/'));
    },
    sidebarMouseEnter() {
      if (!this.sidebarStatic && (isScreen('lg') || isScreen('xl'))) {
        this.switchSidebar(false);
        this.setActiveByRoute();
      }
    },
    sidebarMouseLeave() {
      if (!this.sidebarStatic && (isScreen('lg') || isScreen('xl'))) {
        this.switchSidebar(true);
        this.changeSidebarActive(null);
      }
    },
  },
  created() {
    this.setActiveByRoute();
  },
  computed: {
    ...mapState('layout', {
      sidebarStatic: state => state.sidebarStatic,
      sidebarOpened: state => !state.sidebarClose,
      activeItem: state => state.sidebarActiveElement,
    }),
  },
};
</script>

<!-- Sidebar styles should be scoped -->
<style src="./Sidebar.scss" lang="scss" scoped/>
