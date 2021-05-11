<template>
  <div>
    <div class="row new-account-login justify-content-center">
      <div class="col-sm-6 col-lg-6 mb-3">
        <div class="title-left">
          <h3>Cuenta de Ingreso</h3>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="InputEmail" class="mb-0">Alias</label>
            <input
              type="text"
              class="form-control"
              name="Usuario"
              v-model="alias"
              placeholder="Ingrese usuario"
            />
          </div>
          <div class="form-group col-md-6">
            <label for="InputPassword" class="mb-0">Contraseña</label>
            <input
              type="password"
              name="Password"
              class="form-control"
              v-model="password"
              placeholder="Ingresar Contraseña"
            />
          </div>
        </div>
        <div class="text-left">
          <button
            type="button"
            class="btn btn-primary"
            data-ajax="true"
            name="usuario"
            @click="Ingresar"
          >
            Acceder
          </button>

          <router-link to="/" class="btn btn-danger">Cancelar</router-link>
        </div>
      </div>
    </div>
    <br>
    <br>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "login",
  data() {
    return {
      loanding: false,
      alias: "",
      password: "",
    };
  },
  created() {},
  methods: {
      Ingresar(){
      if (this.alias == "") {
        return;
      }
      this.loanding = true;
      axios.post(this.RutaNetCore + "Auth/Login", {
          Alias: this.alias,
          Contraseña: this.password,
        })
        .then((respuesta) => {
          return respuesta.data;
        }).then((data) => {
         // console.log(data);
          this.$router.push({name:"menu"});
          this.$store.dispatch("guardarToken", data.token);
        })      
        .catch((err) => {         
          console.log(err);
        });
      }
  },
};
</script>
