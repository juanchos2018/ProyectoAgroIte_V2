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
          <i class="fa fa-plus-circle"></i> Nuevo Categoria
        </b-button>
      </b-nav>
    </div>
    <div>
      <b-card
        class="mt-3"
        header="Listado de Catehorias"
        header-text-variant="white"
        header-tag="header"
        header-bg-variant="primary"
      >
        <b-form> </b-form>
        <div class="">
          <b-table hover :items="items" :fields="fields">          
            <template #cell(name)="data">
              <strong>
                <b class="text-info">{{ data.value.last.toUpperCase() }}</b
                >
              </strong>
            </template>
            <template v-slot:cell(acciones)="{ item }">
             
              <b-button
                variant="primary"
                size="sm"
                class="m-1"
                @click="Editar(item.idCategoria)"
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
      datos: {
        id_usuario: "IdEmpresa1",
        nombre: "",
      },
      //name: { first: 'John', last: 'Doe' },
      fields: [
        { label: "Codigo", key: "idCategoria", sortable: false },
     
         { key: "name", label: "Nombre " },
        { label: "Acciones", key: "acciones", sortable: false },
      ],
      items: [],
      Buscar: "",
      DialogCliente: false,
    };
  },
  created() {},
  mounted() {
    this.GetCategoria();
  },
  methods: {
    Nuevo() {
      this.$router.push({ name: "CategoriaAdd" });
    },
    GetCategoria() {
      let me = this;
      axios({
        method: "get",
        url: "Categoria/GetCategoria",
      })
        .then((response) => {
          me.items = response.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
   
    Editar(id) {
      //  alert(id);
      this.$router.push({ name: "CategoriaEdit",params:{id:id} });
    },
    
  },
};
</script>
