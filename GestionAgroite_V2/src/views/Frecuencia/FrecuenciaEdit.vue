<template>
  <b-container>
    <div>
      <br /><br /><br />
  
      <b-card
        class="mt-3"
        header="Editar Categoria"
        header-text-variant="white"
        header-tag="header"
        header-bg-variant="primary"
      >
        <form action="">
          <div class="form-row">
            <b-form-group
              id="input-group-3"
              label="Nombre:"
              label-for="input-2"
              class="col-md-4"
            >
              <b-input class="p-2 px-4 btn-xs" v-model="Model.nombre">
              </b-input>
            </b-form-group>
          </div>

          <hr />
          <div>
            <b-button
              type="button"
              variant="primary"
              @click="Save"
              class="p-2 px-4 btn-xs"
            >              
              Editar
            </b-button>
          </div>
        </form>
      </b-card>
    </div>
  </b-container>
</template>

<script>
import axios from "axios";

export default {
    
 props: ["id"],
  data() {
    return {
      itemActividad: [],
      itemTipoDocumento: [],
      Model: {
        idFrecuencia: 0,
        nombre: '',
      },
    };
  },
  mounted() {
     this.InfoFrecuencia();
  },
  created() {},
  methods: {
    Save() {
      ///  this.show = true;
      let  me = this;
    //  me.Model.idCategoria=me.id;
      let data =me.Model;
      if (me.Model.nombre=="") {
          alert("llenar campo");
          return;
      }
      axios({
        method: "post",
        url: "Frecuencia/EditFrecuencia",
        data: data,
      })
        .then((response) => {
          console.log(response);
           me.Confirmacion();
        })
        .catch(function (error) {
          console.log(error);
        })
        .finally(() => {});
    },
    InfoFrecuencia(){
        let me = this;
        me.Model.idFrecuencia=me.id;
        let data =me.Model;
        axios({
            method: "post",
            url: "Frecuencia/InfoFrecuencia",
            data:data
        })
        .then((response) => {
          me.Model = response.data;
        })
        .catch(function (error) {
          console.log("errorde : " + error);
        });
     },
    Confirmacion() {
      this.$swal.fire({
        position: "top-end",
        icon: "success",
        title: "Actualizado",
        showConfirmButton: false,
        timer: 1500,
      });
    },
  },
};
</script>

<style></style>
