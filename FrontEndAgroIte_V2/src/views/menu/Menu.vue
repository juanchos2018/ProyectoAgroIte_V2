<template>
    <div class="">

        <b-container class="bv-example-row">           
        <b-row >
           <!--   <div  class="d-md-none" >
                <b-button-group>
                <b-button>Button 1</b-button>
                <b-button>Button 2</b-button>
                <b-button>Button 3</b-button>
                </b-button-group>
            </div> -->
            <div class="d-md-down-none">            
            <b-card >
           <b-list-group>
                 <center>
                 <img src="https://placekitten.com/300/300" class="img1" alt="Avatar">
                 </center>
              <br>
             <b-list-group-item href="#" class="flex-column align-items-start">
        <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">Agregar Productos</h5>
        <small>3 days ago</small>
        </div>
        <b-button variant="outline-primary" style="float:right" @click="MostrarAgregarProducto" >Mostrar</b-button>    
     </b-list-group-item>

    <b-list-group-item href="#" class="flex-column align-items-start" >
        <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">Mis Productos</h5>
        <small class="text-muted">3 days ago</small>
        </div>
        <b-button variant="outline-primary" style="float:right" @click="MosrarMisProductos" >Mostrar</b-button>    
    </b-list-group-item>

    <b-list-group-item href="#"  class="flex-column align-items-start">
        <div class="d-flex w-100 justify-content-between">
        <h5 class="mb-1">Disabled List group item</h5>
        <small class="text-muted">3 days ago</small>
        </div>
  <b-button variant="outline-primary" style="float:right" >Button</b-button>
    </b-list-group-item>
    </b-list-group>
            </b-card>
            </div>
            <b-col>
                <div v-if="MisProductos">
                    <b-card>
                    <h5> Mis Productos</h5>
                    </b-card>                  
                </div>
                <div v-if="AgregarProducto">
                    <b-card>
                    <div class="form-row">
            <b-form-group      
                label="Categoria:"      
                class="col-md-4"               
            >
               <b-form-select              
                id="inline-form-custom-select-pref"
                class="mb-2 mr-sm-2 mb-sm-0"              
                ></b-form-select>
            </b-form-group>

            <b-form-group 
                label="Nombre de Producto:" 
                class="col-md-8" >
                <b-form-input        
                   
                  required
                ></b-form-input>
            </b-form-group>


            
        </div>

          <div class="form-row">
            

            <b-form-group      
                label="Precio:"      
                class="col-md-4"               
            >
                <b-form-input   
                type="number"      
                required
                ></b-form-input>
            </b-form-group>
            <b-form-group      
                label="Descropcion Producto:"      
                class="col-md-8"               
               >
                <b-form-input   
                type="text"      
                required
                ></b-form-input>
            </b-form-group>
        </div>

        <div class="form-row">
            <b-form-group      
                label="Cantidad Producida:"      
                class="col-md-4"              
            >
                <b-form-input      
                  type="number"   
                   required
                ></b-form-input>
            </b-form-group>
 <b-form-group 
                label="Fecha Inicio:" 
                class="col-md-4" >
              <b-form-input   
                type="date"      
                required
                ></b-form-input>
            </b-form-group>
           

                <b-form-group      
                label="Fecha Fin:"      
                class="col-md-4"
            
            >
                  <b-form-input   
                type="date"      
                required
                ></b-form-input>
            </b-form-group>
            
        </div>

        <div class="form-row">
           <b-form-group 
                label="Unidad Medioda:" 
                class="col-md-4" >
                   <b-form-select              
                id="inline-form-custom-select-pref"
                class="mb-2 mr-sm-2 mb-sm-0"              
                ></b-form-select>
            </b-form-group>
             <b-form-group      
                label="Frecuenca:"      
                class="col-md-4"
                
            >
             <b-form-select              
                id="inline-form-custom-select-pref"
                class="mb-2 mr-sm-2 mb-sm-0"              
                ></b-form-select>
            </b-form-group>   
            <b-form-group 
                label="iamgen:" 
                class="col-md-4" >
               <div class="upload-btn-wrapper">
            <button class="btn1">Imagen</button>
            <input type="file" name="myfile" />
            </div>
            </b-form-group>  

                  </div>
                         <b-button type="button" variant="primary" @click="Registar">Registrar</b-button>
                    </b-card>                  
                </div>
            </b-col>
        
        </b-row>
    </b-container>

  
    </div>
</template>
<script>
export default {
    
    data() {
        return{ 
            MisProductos:false,
            AgregarProducto:true,
        }
    },
    created() {

    },
    methods: {
        MosrarMisProductos(){
            this.MisProductos=true;
            this.AgregarProducto=false;
        },
        MostrarAgregarProducto(){
            this.MisProductos=false;
            this.AgregarProducto=true;
        },
        MostrarMiPerfil(){

        }
    }
}
</script>

<style lang="css">
.img1 {
  border-radius: 50%;
  width: 50%;
}

.upload-btn-wrapper {
  position: relative;
  overflow: hidden;
  display: inline-block;
}

.btn1 {
  border: 2px solid gray;
  color: gray;
  background-color: white;
  padding: 5px 15px;
  border-radius: 8px;
  font-size: 15px;
  font-weight: bold;
}

.upload-btn-wrapper input[type=file] {
  font-size: 100px;
  position: absolute;
  left: 0;
  top: 0;
  opacity: 0;
}
</style>