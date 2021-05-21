<template>
    <div>      
   <b-carousel
      id="carousel-1"
      v-model="slide"
      :interval="4000"   
   
      controls
      background="#ababab"
      img-width="1024"
      img-height="480"
      style="text-shadow: 1px 1px 2px #333;"
   
    >
      <!-- Text slides th image -->
      <b-carousel-slide>
             <template #img>
          <img
            class="d-block img-fluid w-100"
            width="1024"
            height="480"
            src="../../assets/banner-01.jpg"
            alt="image slot"
          >
        </template>
      </b-carousel-slide>    
      <b-carousel-slide >
           <template #img>
          <img
            class="d-block img-fluid w-100"
            width="1024"
            height="480"
            src="../../assets/banner-02.jpg"
            alt="image slot"
          >
        </template>
      </b-carousel-slide>

     <b-carousel-slide>
        <template #img>
          <img
            class="d-block img-fluid w-100"
            width="1024"
            height="480"
            src="../../assets/banner-03.jpg"
            alt="image slot"
          >
        </template>
      </b-carousel-slide>
      
    </b-carousel>
     
    </div>
</template>

<script>
export default {
    name: "slider",
    data() {
      return {
           slide: 0,
           sliding: null
      }
    },
    methods: {
        ver(){
            alert("hola we")
        },
     
     
    }
}
</script>

<style scoped>
.offer-box, .slide {
    color: #FFFFFF;
    font-size: 13px;
    padding: 0px 0px 0px 0px;
    font-family: 'Poppins', sans-serif;
}
.carousel-control-next-icon,
.carousel-control-prev-icon {
  background-image: none;
  color: red;
  font-size: 20px;
}
 
</style>