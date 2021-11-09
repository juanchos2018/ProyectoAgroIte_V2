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
          <i class="fa fa-plus-circle"></i> Nueva Unidad de medida
        </b-button>
      </b-nav>
    </div>
    <div>
      <b-card
        class="mt-3"
        header="Listado de Unidades de medida"
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
                >, <b>{{ data.value.first }}</b>
              </strong>
            </template>

            <template v-slot:cell(acciones)="{ item }">
              <b-button
                variant="primary"
                size="sm"
                class="m-1"
                @click="Ver(item.idUnidadVolumen)"
              >
                Ver
              </b-button>
              <b-button
                variant="primary"
                size="sm"
                class="m-1"
                @click="Editar(item.idUnidadVolumen)"
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

export default {
  data() {
    return {
      datos: {
        id_usuario: "IdEmpresa1",
        nombre: "",
      },

      fields: [
        { label: "Codigo", key: "idUnidadVolumen", sortable: false },
        { label: "Nombre", key: "nombre", sortable: false },
        { label: "Acciones", key: "acciones", sortable: false },
      ],
      items: [],
      Buscar: "",
      DialogCliente: false,
    };
  },
  created() {},
  mounted() {
    this.GetUnidadVolumen();
  },
  methods: {
    Nuevo() {
      this.$router.push({ name: "FrecuenciaAdd" });
    },
    GetUnidadVolumen() {
      let me = this;
      axios({
        method: "get",
        url: "UnidadVolumen/GetUnidadVolumen",
      })
        .then((response) => {
          console.log(response.data);
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
