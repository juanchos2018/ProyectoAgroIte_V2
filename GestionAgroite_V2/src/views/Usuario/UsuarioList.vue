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
          <i class="fa fa-plus-circle"></i> Nuevo Usuario
        </b-button>
      </b-nav>
    </div>
    <div>
      <b-card
        class="mt-3"
        header="Listado de Usuarios"
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
                @click="Ver(item.idUsuario)"              >
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
        { label: "Codigo", key: "idUsuario", sortable: false },
        { key: "name", label: "Nombre Completo" },
        { label: "Correo", key: "correo", sortable: false },
     
        { label: "Acciones", key: "acciones", sortable: false },
      ],
      items: [],
      Buscar: "",
      DialogCliente: false,
    };
  },
  created() {},
  mounted() {
    this.GetUsuario();
  },
  methods: {
    Nuevo() {
      this.$router.push({ name: "UsuarioAdd" });
    },
    GetUsuario() {
      let me = this;
      axios({
        method: "get",
        url: "Usuario/GetAllUsers",
      })
        .then((response) => {
       //   console.log(response.data);
          me.items = response.data;
        })
        .catch(function(error) {
          console.log(error);
        });
    },
    Ver(id) {    
       this.$router.push({ name: "UsuarioVer",params:{idusuario:id} });
    },
    Editar(id) {
       this.$router.push({ name: "UsuarioEdit",params:{idusuario:id} });
    },
    
  },
};
</script>
