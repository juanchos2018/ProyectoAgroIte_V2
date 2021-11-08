<template>
    <div>
        	<div class="container-fluid p-0">					
					<div class="row">
						<div class="col-md-4 col-xl-3">
							<div class="card mb-3">
								<div class="card-header">
									<h5 class="card-title mb-0">Perfil </h5>
								</div>
								<div class="card-body text-center">
								
									<img  v-if="img_usuario=='default_image'" src="../../assets/imgusuario.png" alt="Christina Mason" class="img-fluid rounded-circle mb-1" width="128" height="138" />
								
									<img   v-else :src="img_usuario" alt="Christina Mason" class="img-fluid rounded-circle mb-1" width="128" height="138" />
								
									<h5 class="card-title mb-0">{{nombre_usuario}}</h5>
									<div class="text-muted mb-2">Taxista</div>

									<div>										
									
										<b-button class="btn btn-primary btn-sm" @click="Chat" >Mensaje</b-button>
									</div>
								</div>
								<hr class="my-0" />
							<div class="card-body">
									<h5 class="h6 card-title">Informacion</h5>
									<ul class="list-unstyled mb-0">
										<li class="mb-1"><span data-feather="home" class="feather-sm mr-1"></span> Correo : <h5>{{correo_usuario}}</h5></li>
										<li class="mb-1"><span data-feather="map-pin" class="feather-sm mr-1">Dni : </span> <h5>{{dni_usuario}}</h5></li>
									</ul>
								</div>
								<hr class="my-0" />
								
								<hr class="my-0" />
								<div class="card-body">
									<h5 class="h6 card-title">Redes Sociales</h5>
									<ul class="list-unstyled mb-0">									
										<li class="mb-1"><span class="fab fa-facebook fa-fw mr-1"></span> <a href="#">Facebook</a></li>
										<li class="mb-1"><span class="fab fa-instagram fa-fw mr-1"></span> <a href="#">Instagram</a></li>
										<li class="mb-1"><span class="fab fa-linkedin fa-fw mr-1"></span> <a href="#">LinkedIn</a></li>
									</ul>
								</div>
							</div>
						</div>

						<div class="col-md-8 col-xl-9">
							<div class="card">
								<div class="card-header">
									<h5 class="card-title mb-0">Informacion MTC</h5>
								</div>
								<div class="card-body h-100" v-for="item in papeletas" :key="item.key">

									<div class="d-flex align-items-start">

										<img  v-if="img_usuario=='default_image'" src="../../assets/imgusuario.png" alt="Christina Mason" class="rounded-circle mr-2" width="36" height="36" />
										<img   v-else :src="img_usuario" alt="Christina Mason" class="rounded-circle mr-2" width="36" height="36" />
								
										<div class="flex-grow-1">
											<small class="float-right text-navy">{{item.fecha}}</small>
											<strong>{{item.conductor}} </strong>  <br />
											<small class="text-muted">{{item.estado_deuda}}</small><br />
										</div>
									</div>	
									<hr />
                                    <br>									
								</div>
								<a href="#" class="btn btn-primary btn-block" v-b-modal.modalPopover >Reponder</a>
							</div>
						</div>
				</div>

			</div>

			
			<b-modal id="modalPopover" title="Responder" ok-only>
				
			  <b-card>				
				<b-card-text>
					YA no Necesitamos
				</b-card-text>
			  <b-button squared variant="danger" style="float:right" @click="Rechazado" >Rechazar</b-button>
				</b-card>
				 <b-card>				
			<b-card-text>
					LLamanos para Cordinar
				</b-card-text>			
				  <b-button squared variant="primary"  style="float:right" @click="Oportunidad">Coordinar</b-button>
			</b-card>
			 <b-card>				
			<b-card-text>
					Te estamos enviado la Requisitos
				</b-card-text>			
				  <b-button squared variant="success"  style="float:right" @click="Aceptado">Aceptar</b-button>
			</b-card>
			</b-modal>

    </div>
</template>

<script>

import axios from  'axios';
export default {
	
	data(){
		return{
		dni_usuario:'',
		nombre_usuario:'',
		apellido_usuario:'',
		id_usu:'',
		img_usuario:'',
		token_usuario:'',
		correo_usuario:'',
		img_empresa:'https://firebasestorage.googleapis.com/v0/b/fir-app-cf755.appspot.com/o/NuevoProducto%2Fimgjuancho.jpg?alt=media&token=b48c6e91-3f3e-4f13-81cc-87d1e6e1908a',
        ruta_documento_doc:'https://firebasestorage.googleapis.com/v0/b/fir-app-cf755.appspot.com/o/Publicaciones%2FDocumentoPlantilla.docx?alt=media&token=fb37a411-75b4-4879-8525-08962b12afa5',      
		papeletas:[],
		notificar:{
			nombre_empresa:'',
			fecha:'',
			mensaje:'',
			detalle:'',
			ruta_documento:'',
			image_empresa:'',
			id_usuario:'',
			token:'',
			estado:''
		}
		}
	},
	created(){
	
	},
	mounted(){
        this.GetDatos()
    },
	methods:{
		Chat(){
              
             this.$router.push('/app/chat/'+this.id_usu);
		},	
		 GetDatos(){
			var item = this.$route.params.id_usuario
			if(item){   				
			    this.id_usu=item;	 
				this.DatosTaxista(item);  
			}         
	   }, 
	   DatosTaxista(id_usuario){		  
			 let me = this;
			 me.notificar.id_usuario=id_usuario;            
                  axios({
                      method: 'get',
                      url: 'Usuario/ObtenerUsuario/'+id_usuario,                                       
                  })
                  .then(response => {
					 // console.log(response.data);
					 var ruta ="";
					  me.nombre_usuario=response.data.data.nombre_usuario;
					  me.dni_usuario=response.data.data.dni_usuario;
					  me.correo_usuario=response.data.data.correo_usuario;	
 					  me.img_usuario=response.data.data.image_usuario;					
					  me.token_usuario=response.data.data.token;
					
					  me.PapeletasTaxista(id_usuario);                                       

                  }).catch(function (error) {
                      console.log(error);
            });
	   },
	   PapeletasTaxista(id_usuario)
	   {
		    let me = this;					        
                  axios({
                      method: 'get',
                      url: 'Papeleta/ObtenerPapeleta/'+id_usuario,                                       
                  })
                  .then(response => {
					  console.log(response.data);
					  me.papeletas=response.data;		
                  }).catch(function (error) {
                      console.log(error);
            });
	   },
	   Rechazado(){
			let me =this;
			 me.notificar.nombre_empresa="RAdioTaxi";
			 me.notificar.mensaje="No";
			 me.notificar.detalle="Para otra ocassion we";
			 me.notificar.ruta_documento="nulo";    
			 me.notificar.image_empresa=me.img_empresa;     
			 me.notificar.token=me.token_usuario;      
			 me.notificar.estado='Rechazado';        
             axios.post('Notificacion/Notificar',me.notificar,{ emulateJSON: true})                
               .then(function(response){
				   console.log(response)
				   me.Confirmacion();
                                     
                }).catch(function(error){
                    console.log(error);
                     
             });
	   },
	   Oportunidad(){
		  let me =this;
			 me.notificar.nombre_empresa="RAdioTaxi";
			 me.notificar.mensaje="Pdoria ser";
			 me.notificar.detalle="Te talvez";
			 me.notificar.ruta_documento="nulo";    
			 me.notificar.image_empresa=me.img_empresa;    
			 me.notificar.token=me.token_usuario;    
			 me.notificar.estado='Talvez';          
             axios.post('Notificacion/Notificar',me.notificar,{ emulateJSON: true})                
               .then(function(response){
				   console.log(response)    
				     me.Confirmacion();                                 
                }).catch(function(error){
                    console.log(error);
                     
             });
	   },
	   Aceptado(){
		 let me =this;
			 me.notificar.nombre_empresa="RAdioTaxi";
			 me.notificar.mensaje="Aceptado we ";
			 me.notificar.detalle="Te Necesitamos";
			 me.notificar.ruta_documento=me.ruta_documento_doc;    
			 me.notificar.image_empresa=me.img_empresa;    
			 me.notificar.token=me.token_usuario;     
		     me.notificar.estado='Aceptado';       
             axios.post('Notificacion/Notificar',me.notificar,{ emulateJSON: true})                
               .then(function(response){
                   console.log(response)
                    me.Confirmacion();
                }).catch(function(error){
                    console.log(error);
                     
            });
	   },
	   Confirmacion(){
              this.$swal.fire({
                  position: 'top-end',
                  icon: 'success',
                  title: 'Enviado Respuesta ..',
                  showConfirmButton: false,
                  timer: 1500
                })
         },
	}
}
</script>