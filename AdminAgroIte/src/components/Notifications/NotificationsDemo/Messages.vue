<template>
 <b-list-group class="listGroup thin-scroll">

    <b-list-group-item class="listGroupItem bg-warning-light" v-for="chat in notificaciones" :key="chat.key" @click="detalle(chat.id_usuario)"  >
      <span class="notificationIcon thumb-sm">
        <img class="rounded-circle" src="../../../assets/people/a2.jpg" alt="..." />
        <i class="status status-bottom bg-success" />
      </span>
      <time class="text-link help float-right">10 sec ago</time>
      <h6 class="m-0 fw-bold mb-1"  >{{chat.usuario}}</h6>
      <p class="deemphasize text-ellipsis m-0" >{{chat.mensaje}} </p>
    </b-list-group-item>    
  </b-list-group>

</template>

<script>
import firebase from '@/firebase'
export default {
  name: 'Messages',

  data(){
    return{
        roomid: '222',
        roomname: 'mchat',
        nickname: 'juancho',
        data: { type:'', nickname:'', message:'' },
        chats: [],
        notificaciones:[],
        errors: [],
        offStatus: false
    }
  },
  created(){
    /*
        let joinData = firebase.database().ref('Notificaciones/'+this.roomid+'/chats').push();
        joinData.set({
          type: 'join',
          user: this.nickname,
          message: this.nickname+' has joined this room.',
          sendDate: Date()
        });
        */
        this.notificaciones=[];
        this.data.message = '';
        firebase.database().ref('Notificaciones').on('value', (data) => {
          this.chats = [];
          this.notificaciones=[];
          data.forEach((doc) => {
            let item = doc.val()
            item.key = doc.key
            this.notificaciones.push(item)
            console.log(data)
          });


        });
  },
  methods:{
      detalle(id_usuario){
        
            this.$router.push('/app/chat/');
      },  
      onSubmit (evt) {
          evt.preventDefault()

          let newData = firebase.database().ref('chatrooms/'+this.roomid+'/chats').push();
          newData.set({
              type: 'newmsg',
              user: this.nickname,
              message: this.data.message,
              sendDate: Date()
          });
          this.data.message = '';
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


};
</script>

<style src="./ListGroup.scss" lang="scss" />
