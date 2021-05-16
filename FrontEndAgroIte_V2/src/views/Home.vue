<template>
  <div>    
   <Slider></Slider>  
  <br>
  <productos></productos>
  </div>
</template>

<script>
// @ is an alias to /src
import Slider from "@/components/slider/Slider.vue";
import productos from "@/components/productos/productos.vue";
export default {
  name: "home",
  components: {
     Slider, 
     productos
  },
};
</script>
<style>
.jumbotron {
  padding: 1rem 0rem;
}
</style>
