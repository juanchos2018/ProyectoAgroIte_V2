<template>
  <div class="auth-page">
    <img class="wave" src="../../assets/wabe2.png">
	<div class="container" >
		
		<div class="">
			<img src="../../assets/bg2.svg" width="400px;" style="margin-top:60px">
		</div>
		<div class="login-content">
			<form class="mt" @submit.prevent="submit">
				<img src="../../assets/avatar.svg">
				<h2 class="title">Bienvenido</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
						  
           		   		<input ref="email" required type="text" name="email"  placeholder="Correo" >
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
            	  <b-button  type="submit"  style="  padding: 10px 10px 10px;                            
                                border-radius: 4px;
                                font-size: 17px;
                                font-weight: bold;
                                line-height: 20px; 
                                margin-bottom: 24px;"
                                >
                                <div class="float-left">
                    <pulse-loader  v-if="loanding"  color="#F2E6E4" ></pulse-loader>
                  </div>Ingresar</b-button>
                 <b-button type="button" @click="Registrar"> Registrar</b-button>
            </form>

           
        </div>
    </div>

<!--
    <b-container>
      <h5 class="auth-logo">
        <i class="fa fa-circle text-primary"></i>
        Sing App
        <i class="fa fa-circle text-danger"></i>
      </h5>
      <Widget class="widget-auth mx-auto" title="<h3 class='mt-0'>Login to your Web App</h3>" customHeader>
        <p class="widget-auth-info">
            Use your email to sign in.
        </p>
        <form class="mt" @submit.prevent="submit">
          <b-alert class="alert-sm" variant="danger" :show="!!errorMessage">
            {{errorMessage}}
          </b-alert>
          <div class="form-group">
            <input class="form-control no-border" ref="email" required type="email" name="email" placeholder="Email" />
          </div>
          <div class="form-group">
            <input class="form-control no-border" ref="password" required type="password" name="password" placeholder="Password" />
          </div>
          <b-button type="submit" size="sm" class="auth-btn mb-3" variant="inverse">Login</b-button>
          <p class="widget-auth-info">or sign in with</p>
          <div class="social-buttons">
            <b-button variant="primary" class="social-button mb-2">
              <i class="social-icon social-google"></i>
              <p class="social-text">GOOGLE</p>
            </b-button>
            <b-button variant="success" class="social-button">
              <i class="social-icon social-microsoft"></i>
              <p class="social-text">MICROSOFT</p>
            </b-button>
          </div>
        </form>
        <p class="widget-auth-info">
          Don't have an account? Sign up now!
        </p>
        <router-link class="d-block text-center" to="login">Create an Account</router-link>
      </Widget>
    </b-container>
   -->
  </div>
</template>

<script>
import Widget from '@/components/Widget/Widget';
import firebase from '@/firebase'
export default {
  name: 'LoginPage',
  components: { Widget },
  data() {
    return {
        loanding:false,
        errorMessage: null,
    };
  },
  methods: {

    Registrar()
    {
       this.$router.push('/registro')
    },
  submit(){
     this.loanding=true;
    firebase
        .auth()
        .signInWithEmailAndPassword(this.$refs.email.value,this.$refs.password.value)
        .then(data => {
       
         console.log(data);
         var verificado=data.user.emailVerified;
         var id =data.user.uid;
              if(verificado){
                 this.loanding=false;
                   window.localStorage.setItem('authenticated', true);
                   this.$router.push('/app/inicio').catch(err => {
              
                  if (
                    err.name !== 'NavigationDuplicated' &&
                    !err.message.includes('Avoided redundant navigation to current location')
                  ) {
                    console(err);
                  }
              });
              }    
              else{
                alert("Crreo no verificado");
                console.log("No existe");
                 this.loanding=false;
              }      

        })
        .catch(err => {
          this.error = err.message;
              alert("Error en datos");
                console.log("No existe");
                 this.loanding=false;
        });
  },

    login() {
      const email = this.$refs.email.value;
      const password = this.$refs.password.value;

      if (email.length !== 0 && password.length !== 0) {
        window.localStorage.setItem('authenticated', true);
        this.$router.push('/app/dashboard').catch(err => {
    // Ignore the vuex err regarding  navigating to the page they are already on.
            if (
              err.name !== 'NavigationDuplicated' &&
              !err.message.includes('Avoided redundant navigation to current location')
            ) {
              
              console(err);
            }
          });
      }
    },
  },
  created() {
    if (window.localStorage.getItem('authenticated') === 'true') {
      this.$router.push('/app/main/analytics').catch(err => {
    // Ignore the vuex err regarding  navigating to the page they are already on.
            if (
              err.name !== 'NavigationDuplicated' &&
              !err.message.includes('Avoided redundant navigation to current location')
            ) {
              // But print any other errors to the console
              console(err)
             
            }
          });
    }
  },
};
</script>
<style src="./stilo.scss" scoped lang="scss"></style>