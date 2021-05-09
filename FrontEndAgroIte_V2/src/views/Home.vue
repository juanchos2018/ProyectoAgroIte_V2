<template>
  <div class="home-component">    
   <Slider></Slider>  
  </div>
</template>

<script>
// @ is an alias to /src
import Slider from "@/components/slider/Slider.vue";
export default {
  name: "home",
  components: {
     Slider
  },
};
</script>
<style>
.jumbotron {
  padding: 1rem 0rem;
}
</style>
