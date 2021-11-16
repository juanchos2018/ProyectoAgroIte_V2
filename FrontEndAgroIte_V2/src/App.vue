<template>
  <div  >   
      <Heder></Heder>
      <router-view />   
      <br>

     
    <footer1></footer1>
  </div>
</template>

<script>

import Heder from  '@/components/header/Heder'

import footer1 from  '@/components/footer/footer'

export default {
  components:{Heder,footer1},
  data() {
    return {
      cartValue: 0,
        visible: false
    };
  },
 
  methods: {
    /* Initially loading the cart products from local storage */   
   
  },
  created() {
   
  },
};
</script>


<style lang="css">
@import "../node_modules/bootstrap/dist/css/bootstrap.min.css";

#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale; 
  color: #2c3e50;
}


.footer {
  position: relative;
  bottom: 0;
  width: 100%;
  height: 60px; /* Set the fixed height of the footer here */
  background-color: #f5f5f5;
}



* a {
  color: #42b983;
}

* .fa {
  font-size: 18px;
}

.buttonGreen-outline {
  width: 100%;
  color: #41b883;
  background-color: transparent;
  border-color: #41b883;
}
.buttonGreen-outline:hover {
  color: #ffffff;
  background-color: #41b883;
  border-color: #41b883;
}

.buttonGreen {
  color: #fff;
  background-color: #41b883;
}

.buttonGreen:hover {
  background-color: #42a97b;
}
</style>
