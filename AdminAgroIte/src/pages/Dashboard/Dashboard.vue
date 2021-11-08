<template>
  <div class="dashboard-page">
    <h1 class="page-title">Inicio</h1>
  
 <Widget title="<h5> <span class='fw-semi-bold'>Grafico</span></h5>"  close collapse customHeader>
               <div  class="form-row">
      
               </div>               
            <column-chart :data="[['Sun', 32], ['Mon', 46], ['Tue', 28]]"></column-chart>
     </Widget>

  </div>
</template>

<script>
import Widget from '@/components/Widget/Widget';

export default {
  name: 'Dashboard',
  components: {
    Widget,  
  },
  data() {
    return {
     valor:''
    
    };
  },
  methods: {
    
   
    
  }
};
</script>

<style src="./Dashboard.scss" lang="scss" />
