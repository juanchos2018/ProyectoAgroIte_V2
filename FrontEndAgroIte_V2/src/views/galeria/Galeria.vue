<template>
   <div class="about">
    <div class="">
      <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Inicio</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                        <li class="breadcrumb-item active">Acerca de Nosotros</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

  <div class="about-box-main">
    <div class="container">
          <div class="products-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>Galeria</h1>
                        <p>Listado de Productos </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="special-menu text-center">
                        <div class="button-group filter-button-group">
                            <button :class="e1"  @click="Todo">Todo</button>
                            <button :class="e2" @click="Bulba">Productos Procesados</button>
                            <button :class="e3" data-filter=".fruits">Productos Agricolas</button>
							<button :class="e4" data-filter=".podded-vegetables">Productos de origen Animal</button>
                        </div>
                    </div>
                </div>
            </div>           

            <div class="row special-list">

                <div class="col-lg-4 col-md-6 special-grid bulbs"   v-for="item in productos"
                         :key="item.key">
                    <div class="products-single fix">
                        <div class="box-img-hover">                                                        
                              <img :src="rutaApi + item.rutaImagen" style="height:350px;" class="img-fluid"  alt="Image"  />
                            <div class="mask-icon">
                                <ul>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Ver"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fas fa-sync-alt"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                </ul>
                                <!-- <button class="cart" >Agregar Carrito</button> -->
                                 <a class="cart" @click="AgregarCarrito(item.idProducto,item.nombre_Producto,item.rutaImagen,item.precio)" >Agregar Carrito </a>

                            </div>
                        </div>
                    </div>
                </div>

                           
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
      CantidadItem:1,
      productos: [],
      rutaApi: "",
      e1:'active',
      e2:'',
      e3:'',
      e4:'',
      e5:'',

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
    Todo(){      
        this.e1="active";
        this.e2="";
    },
    Bulba(){
        this.e1="";
        this.e2="active";
    },
    AgregarCarrito(idProducto,nombre_Producto,rutaImagen,precio){
      var sub=this.CantidadItem *parseInt(precio)
     // let data = {codigo:idProducto,Descripcion:nombre_Producto,Precio:precio,Cantidad:this.CantidadItem,Total:sub, photo:rutaImagen}
     /// this.$store.commit('agregar', data);
       let data = {id_product:idProducto,Descripcion:nombre_Producto,unit_price:parseInt(precio),quantity:parseInt(this.CantidadItem),total_price:sub, photo:rutaImagen,state:1}

       this.$store.commit('addCart', data);
      this.CantidadItem=1;
      alert("Agregado Carrito")
    }

  },
};
</script>
<style>
.center-cropped {
  object-fit: none; /* Do not scale the image */
  object-position: center; /* Center the image within the element */
  height: 300px;
  width: 300px;
}
</style>