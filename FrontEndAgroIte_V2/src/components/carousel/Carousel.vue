<template>
    <div>     
       <carousel :autoplay="true" :nav="false">  
    <img src="../../assets/instagram-img-01.jpg"   width="150"  height="300">
     <img src="../../assets/instagram-img-02.jpg"  width="200" height="300">
      <img src="../../assets/instagram-img-03.jpg" width="200" height="300" >
       <img src="../../assets/instagram-img-04.jpg"  width="200" height="300">
        <img src="../../assets/instagram-img-05.jpg"  width="200" height="300">
         <img src="../../assets/instagram-img-06.jpg"  width="200" height="300">
        <img src="../../assets/instagram-img-07.jpg" width="200" height="300" > 
</carousel> 
    </div>
</template>

<script>

import carousel from 'vue-owl-carousel'

export default {
    name: "caurosel",
    components: { carousel },
    
}
</script>

<style>

</style>