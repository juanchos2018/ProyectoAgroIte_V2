<template>
  <div>
    <div>
      <b-nav pills>
        <b-button
          type="button"
          class="m-1 p-2 px-4 btn-xs"
          @click="Nuevo"
          variant="primary"
        >
          <i class="fa fa-plus-circle"></i> Nueva Asociacion
        </b-button>
      </b-nav>
    </div>
    <div>
      <b-card
        class="mt-3"
        header="Listado de Asociaciones"
        header-text-variant="white"
        header-tag="header"
        header-bg-variant="primary"
      >
        <b-form> </b-form>
        <div class="">
          <b-table hover :items="items" :fields="fields">
           
             <template #cell(name)="data">
              <strong>
                <b class="text-info">{{ data.value.first.toUpperCase() }}</b
                >, <b>{{ data.value.last }}</b>
              </strong>
            </template>
            <template v-slot:cell(acciones)="{ item }">
              <b-button
                variant="primary"
                size="sm"
                class="m-1"
                @click="Ver(item.idUsuario)"
              >
                Ver
              </b-button>
              <b-button
                variant="primary"
                size="sm"
                class="m-1"
                @click="Editar(item.idUsuario)"
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
</template>
<script>
import axios from "axios";
import firebase from "@/firebase";

export default {
  data() {
    return {
      datos: {
        id_usuario: "IdEmpresa1",
        nombre: "",
      },
      //name: { first: 'John', last: 'Doe' },
      fields: [
        { label: "Codigo", key: "idAsociacion", sortable: false },
         { key: "name", label: "Razon Social" },
        { label: "Direccion", key: "direccion", sortable: false },
        { label: "Telefono", key: "telefono", sortable: false },
        { label: "Acciones", key: "acciones", sortable: false },
      ],
      items: [],
      Buscar: "",
      DialogCliente: false,
    };
  },
  created() {},
  mounted() {
    this.GetAsociacion();
  },
  methods: {
    Nuevo() {
      this.$router.push({ name: "UsuarioAdd" });
    },
    GetAsociacion() {
      let me = this;
      axios({
        method: "get",
        url: "Asociacion/GetAsociacion",
      })
        .then((response) => {         
          me.items = response.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    Ver(id) {},
    Editar(id) {},
    
  },
};
</script>
