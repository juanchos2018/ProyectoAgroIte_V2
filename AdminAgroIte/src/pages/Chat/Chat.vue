<template>
  <b-container class="bv-example-row">
  <b-row>
    <b-col col lg="4"> 
 <Widget >
<section data-v-44188131="" class="chat-section personal-chats mb-0 d-none d-lg-block">
  <h5 data-v-44188131="">chat  </h5>

<ul data-v-44188131="" class="chat-list">
  <li v-for="item in SubChat"  :key="item.key"  data-v-ef00655e="" data-v-44188131="" class="chat-list-item" @click="ListarChat(item.id_usuario)">
    <div data-v-ef00655e="" class="chat-list-item-wrapper">
      <div data-v-482edba4="" data-v-ef00655e="" class="avatar mr-3" style="height: 45px; width: 45px; min-width: 45px;">
       <div data-v-482edba4="" class="image-wrapper" style="font-size: 15px;">
      
       <img data-v-482edba4="" width="40px" class="rounded-circle" src="../../assets/imgusuario.png"></div>
   <!--   <img  v-if="item.image_usuario=='default_image'" src="../../assets/imgusuario.png" alt="Christina Mason" class="img-fluid rounded-circle mb-1" width="128" height="138" />
								
			<img   v-else :src="item.image_usuario" alt="Christina Mason" class="img-fluid rounded-circle mb-1" width="128" height="138" />
							-->	
        <span data-v-482edba4="" class="status bg-success"></span>
        </div>
          <section data-v-ef00655e="" class="chat-item-main">
            <header data-v-ef00655e="" class="d-flex align-items-center justify-content-between mb-1">
         <h6 data-v-ef00655e="" class="chat-title"><!---->
            <strong >{{item.nombre_usuario}}</strong>  
            <!----></h6><span data-v-ef00655e="" class="ml-auto timestamp">
            2 Nov
          </span></header>
          <p data-v-ef00655e="" class="chat-last-message" style="float:right;margin-right:50px">
            <span data-v-ef00655e="" class="owner-indicator mr-1">         
          </span><!---->
           {{item.mensaje}}
        </p></section>
        </div>
     </li>     
    </ul>
      </section>
     </Widget>

    </b-col>
    <b-col>

 <b-col cols="12">
      <h2>       
        <b-link @click="exitChat()">Chat</b-link>
      </h2>
      <div class="chat-box" v-chat-scroll>
        <b-list-group>
          <b-list-group-item class="chat-item" v-for="chat in chats" :key="chat.key">
            <div class="chat-status text-center" v-if="chat.type==='join'||chat.type==='exit'">
              <span class="chat-date">{{chat.hora}}</span>
              <span class="chat-content-center">{{chat.mensaje}}</span>
            </div>
            <div v-else>
              <div class="chat-message text-right" v-if="chat.nombre === nickname">
                <div class="right-bubble">
                  <span class="msg-name">yo</span>
                  <span class="msg-date">{{chat.hora}}</span>
                  <p text-wrap>{{chat.mensaje}}</p>
                </div>
              </div>
              <div class="chat-message text-left" text-left v-if="chat.nombre !== nickname">
                <div class="left-bubble">
                  <span class="msg-name">{{chat.nombre}}</span>
                  <span class="msg-date">{{chat.hora}}</span>
                  <p text-wrap>{{chat.mensaje}}</p>
                </div>
              </div>
            </div>
          </b-list-group-item>
        </b-list-group>
      </div>
      <b-form @submit="onSubmit">
          <b-input-group>
              <b-form-input id="message" autocomplete="off" v-model.trim="data.message" placeholder="escribe mensaje"></b-form-input>
              <b-button type="submit" variant="primary" :disabled="!data.message"> <b-icon icon="arrow-right-circle"></b-icon> </b-button>
          </b-input-group>
        </b-form>
    
    </b-col>
    </b-col>   
  </b-row>
  </b-container>
</template>

<script>

import firebase from '@/firebase'
import moment from 'moment'
import axios from  'axios';
export default {
  name: 'Chat',
  props:{},
  data () {
    return {
        roomid: '222',
        id_empresa:'',
        IdEmpresa:'',
        NombreEmpresa:'',
        roomname: 'Chat',
        nickname: 'RadioTaxi',
        img_empresa:'https://firebasestorage.googleapis.com/v0/b/fir-app-cf755.appspot.com/o/NuevoProducto%2Fimgjuancho.jpg?alt=media&token=b48c6e91-3f3e-4f13-81cc-87d1e6e1908a',
              
        data: { type:'', nickname:'', message:'' },
        data2: { type:'', nombre:'', message:'' },
        chats: [],
        errors: [],
        SubChat:[],
        offStatus: false,
        id_usuario:'',
    }
  },
  created () {   
    firebase.auth().onAuthStateChanged(user =>  {
        if (user) {          
        //  this.NombreUsuario=user.displayName;
         this.id_empresa=user.uid;        
         this.ListarSubChat(user.uid);
         this.DatosUsuario(this.id_empresa);


        } else {       
          console.log("no logueado")
        }
        });  
  },
  mounted() {
    this.$nextTick(() => {
       //    this.ListarFase(this.idmetodologia)
           this.GetDatos();
       });
      
  },
  methods: {
     GetDatos(){
          var id = this.$route.params.id_usuario
          if(id){      
         //   console.log(id);
            this.id_usuario=id;
          //  console.log(this.id_empresa);
            this.ListarChat(id);              
          }  
          else{
            console.log("lelga vacio");
          }
       },
    onSubmit (evt) {
        evt.preventDefault()
        var timeArr = moment(). format('HH:mm:ss')  
        let newData = firebase.database().ref('Chat/'+this.id_empresa+'/'+ this.id_usuario).push();
        newData.set({
            type_mensaje: '1',
            nombre: this.nickname,
            mensaje: this.data.message,
            hora:timeArr,                    
            fotoPerfil:this.img_empresa
        });
          this.SubChat2();

        this.data.message = '';
    },
   
    ListarChat(id_usuario){
         this.data.message = '';
         this.id_usuario=id_usuario;
          firebase.database().ref('Chat/'+this.id_empresa+'/'+id_usuario).on('value', (snapshot) => {
            this.chats = [];
            snapshot.forEach((doc) => {
              let item = doc.val()
              item.key = doc.key
              this.chats.push(item)
            });
       });
    },
    ListarSubChat(id){      
          firebase.database().ref('SubChat/'+id).on('value', (snapshot) => {
            this.SubChat = [];
            snapshot.forEach((doc) => {
              let item = doc.val()
              item.key = doc.key
              this.SubChat.push(item)
            });
        });
    },  
    SubChat2(){
           let id_empresa=this.id_empresa;   
           let nombre_usuario=this.nickname;
           let id_usuario=this.id_usuario;
           let image_usuario=this.img_empresa;  
           let mensaje=this.data.message;  
          const obj={id_empresa:id_empresa,nombre_usuario:nombre_usuario,id_usuario:id_usuario,image_usuario:image_usuario,mensaje:mensaje};
           axios.post('Chat/Mensaje',obj).then(response => {                       
              console.log(response);               
          }).catch(function (error) {
              console.log(error);
          }) .finally(() => {
              
          })
      },
      DatosUsuario(id_usuario){		  
                      let me = this;                      
                 axios({ method: 'get',
                         url: 'Usuario/ObtenerUsuario/'+id_usuario,                                       
                       })
                      .then(response => {  
                          me.NombreEmpresa=response.data.data.nombre_usuario;  
                          // console.log(response.data);
                          }).catch(function (error) {
                           console.log(error);
                 });
	      },
        exitChat () {
          let exitData = firebase.database().ref('chatrooms/'+this.roomid+'/chats').push()
          exitData.set({
            type: 'exit',
            user: this.nickname,
            message: this.nickname+' has exited this room.',
            sendDate: Date()
          })

      this.offStatus = true
      //router.go(-1)
    }
  }
}
</script>

<style src="./chat.scss" lang="scss" scoped/>
