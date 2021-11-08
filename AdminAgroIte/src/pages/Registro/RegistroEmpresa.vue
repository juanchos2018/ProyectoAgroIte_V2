<template>
  <div class="auth-page">
    <img class="wave" src="../../assets/wabe2.png">
	<div class="container" >
		
		<div class="img">
			<img src="../../assets/form.svg">
		</div>
		<div class="login-content">

			<form>
				<div class="form-row">
					<div class="form-group col-md-6">
					<label >Ruc</label>
					<input type="number" v-model="datos.ruc" class="form-control"  >
					</div>
					<div class="form-group col-md-6">
					<br>
					
					<b-button class="btn btn-primary" variant="primary" @click=" Consultar">
						<b-spinner small type="grow" v-if="retorno"></b-spinner > Buscar</b-button>
					</div>
				</div>
				<div class="form-group">
					<label for="inputAddress">Nombre</label>
					<input type="text" v-model="nombre" class="form-control"  >
				</div>
				<div class="form-group">
					<label for="inputAddress2">Direccion</label>
					<input type="text" v-model="direccion" class="form-control"  >
				</div>
				<div class="form-group">
					<label for="inputAddress2">Correo</label>
					<input type="text"  v-model="Empresa.correo_usuario" class="form-control"  >
				</div>
				<div class="form-group">
					<label for="inputAddress2">Contraseña</label>
					<input type="password"  v-model="Empresa.password" class="form-control"  >
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
					<label for="inputCity">Telefono</label>
					<input type="text" v-model="Empresa.telefono" class="form-control" id="inputCity">
					</div>
<!--
					<div class="form-group col-md-4">
					<label for="inputState">State</label>
					<select id="inputState" class="form-control">
						<option selected>Choose...</option>
						<option>...</option>
					</select>
					</div>
					<div class="form-group col-md-2">
					<label for="inputZip">Zip</label>
					<input type="text" class="form-control" id="inputZip">
					</div>-->
				</div>
				
				<button type="button" class="btn btn-primary" @click="Registrar">Registrar</button>
				</form>
			<!--
			<form class="mt" @submit.prevent="submit">				
				<h2 class="title">Registrar</h2>
				
				 <div class="div">
           		   		<input ref="ruc" required type="number" class="form-control" v-model="datos.ruc" name="ruc"  placeholder="Ruc" >
           		   </div>	
					  <button type="button" class="btn btn-primary" @click="Consultar">consultar</button>
           		<div class="input-div one">
   	

           		   <div class="i">
           		   	<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		<input ref="email" required type="text"  name="email"  placeholder="Correo" >
					
           		   </div>
           		</div>
                   <div class="input-div pass">
           		   <div class="i"> 
           		   <i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    <input  ref="name" required type="text" v-model="nombre" name="name"   placeholder="Nomnre">
           		    </div>
            	</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    <input  ref="password" required type="password" name="password"   placeholder="Contraseña">
           		    </div>
            	</div>
            	
            	  <b-button  type="submit"  class="boton" style="  padding: 10px 10px 10px;
                            
                                border-radius: 4px;
                                font-size: 17px;
                                font-weight: bold;
                                line-height: 20px; 
                                margin-bottom: 24px;"
                                >Registrar</b-button>
                     <b-button type="button" @click="Login">login</b-button>
            </form>
           -->
        </div>
        
    </div>
   </div>
</template>

<script>
import Widget from '@/components/Widget/Widget';
import firebase from '@/firebase'
import axios from  'axios';
export default {
 
  components: { Widget },
  data() {
    return {
	  retorno:false,			
	  errorMessage: null,
	  datos:{ruc:''},
	  nombre:'',
	  direccion:'',
	  Empresa:{ nombre_usuario:'',
				direccion:'',
				telefono:'',
				password:'',
				correo_usuario:'',
				ruc:'',
				img_usuario:'default_image	'
				}
    };
  },
  methods: {
    Login()
    {
       this.$router.push('/login')
    },   
    Consultar(){ 
		this.retorno=true;
		 axios({
                  method: 'post',
                  url: 'Usuario/ConsultaRuc',
                  data:this.datos,
                  })
                  .then(response => {                      
					   console.log(response)
					   this.nombre=response.data.nombre;
					   this.direccion=this.data.direccion;
					   this.retorno=false;
					   
                  }).catch(function (error) {
					  console.log(error);
					  this.retorno=false;
                  }) .finally(() => {
                      this.retorno=false;
               })
	},

	Registrar(){

			this.Empresa.nombre_usuario=this.nombre;
			this.Empresa.direccion=this.direccion;
			this.Empresa.ruc=this.datos.ruc;

		      axios({
                    method: 'post',
                    url: 'Usuario/SetUsuario',
                     data:this.Empresa,
                  })
                  .then(response => {
                      
					   console.log(response)
					   this.$router.push('/login');
					   
                  }).catch(function (error) {
                      console.log(error);
                  }) .finally(() => {
                     
                  })
		},
		 Confirmacion(){
              this.$swal.fire({
                  position: 'top-end',
                  icon: 'success',
                  title: 'Registrado ..',
                  showConfirmButton: false,
                  timer: 1500
                })
           },
	},
	created() {
	
	}

};
</script>
<style src="./stilo.scss" scoped lang="scss"></style>