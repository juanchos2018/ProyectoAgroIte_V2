<template>
  <div class="container">

      <div class="title-all text-center">
                        <h1>Productos Agricolas</h1>
                        <p>¡Ultimos productos registrados!</p>
                        
                    </div>
                    
    <div class="row">
      <div
        class="col-4"
        v-for="item in productos"
        :key="item.key"
      >
        <div>
          <div class="blog-box">
            <div class="blog-img">
              <img :src="rutaApi + item.rutaImagen"  style="cursor:pointer;height:255px;width:100%" alt="" />
            </div>
            <div class="blog-content">
              <div class="title-blog">
                <h3>
                  <b
                    ><i class="fa fa-fire"></i>&nbsp; {{ item.nombre_Producto }}
                  </b>
                </h3>
                <h3 style="margin:0px;">
                  <b><i class="fa fa-user"></i></b>&nbsp;{{ item.apellidos }},
                  {{ item.nombres }}
                </h3>
                 <h3 style="margin:0px;">
                  <b><i class="fa fa-users"></i></b>&nbsp;{{ item.organizacion }}
                </h3>
                <h3 style="margin-top:5px;margin-bottom:5px;">
                  <b><i class="fa fa-map-marker"></i></b>&nbsp;{{item.direccion}}
                </h3>
                <p>
                  <b>&nbsp;{{ item.descripcion }}</b>
                </p>
                <a href="#">Ver Mas</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
export default {
  name: "productos",
  data() {
    return {
      productos: [],
      rutaApi: "",
    };
  },
  created() {
    this.ListProduct();
  },
  methods: {
    ListProduct() {
      let me = this;
      me.rutaApi = this.RutaNetCore;
      axios
        .get(this.RutaNetCore + "Producto/GetProductoAll")
        .then((response) => {
         // console.log(response.data);
          me.productos = response.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
  },
};
</script>
<style>

</style>