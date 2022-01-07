<template>

<b-container>
  <div>
    <div>
        <br><br><br>
      <b-nav pills>
        <b-button
          type="button"
          class="m-1 p-2 px-4 btn-xs"
          @click="Nuevo"
          variant="primary"
        >
          <i class="fa fa-plus-circle"></i> Nueva Frecuencia
        </b-button>
      </b-nav>
    </div>
    <div>
      <b-card
        class="mt-3"
        header="Listado de Frecuencia"
        header-text-variant="white"
        header-tag="header"
        header-bg-variant="primary"
      >
        <b-form> </b-form>
        <div class="">
          <b-table hover :items="items" :fields="fields">          
         
            <template v-slot:cell(acciones)="{ item }">
             
              <b-button
                variant="primary"
                size="sm"
                class="m-1"
                @click="Editar(item.idfrecuencia)"
              >
                Editar</b-button
              >
            </template>
          </b-table>
        </div>
        <!-- Fin tabla -->
      </b-card>
    </div>
    <div></div>
  </div>


  </b-container>

</template>
<script>
import axios from "axios";

export default {
  data() {
    return {           
      fields: [
        { label: "Codigo", key: "idfrecuencia", sortable: false },     
         { label: "Nombre ",key: "nombre" },
        { label: "Acciones", key: "acciones", sortable: false },
      ],
      items: [],
      Buscar: "",
      DialogCliente: false,
    };
  },
  created() {},
  mounted() {
    this.GetFrecuencia();
  },
  methods: {
    Nuevo() {
      this.$router.push({ name: "FrecuenciaAdd" });
    },
    GetFrecuencia() {
      let me = this;
      axios({
        method: "get",
        url: "Frecuencia/GetFrecuencia",
          })
        .then((response) => {
            console.log(response)
          me.items = response.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    },   
    Editar(id) {
      //  alert(id);
      this.$router.push({ name: "FrecuenciaEdit",params:{id:id} });
    },
    
  },
};
</script>
