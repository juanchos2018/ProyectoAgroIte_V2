<template>
  <b-container>
    <div>
      <div>
        <br /><br /><br />
        <b-nav pills>
          <b-button
            type="button"
            class="m-1 p-2 px-4 btn-xs"
            @click="Nuevo"
            variant="primary"
          >
            <i class="fa fa-plus-circle"></i> Nuevo Pruducto
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
            <table class="table table-hover table-bordered">
              <thead>
                <tr>
                  <th width="5%" class="text-center">#</th>

                  <th width="6%" class="text-center">Código</th>
                  <th width="40%" class="text-center">Nombre</th>
                  <th width="10%" class="text-center">Precio</th>
                  <th width="6%" class="text-center">Foto</th>

                  <th width="8%" class="text-center">Acciones</th>
                </tr>
              </thead>
              <tbody v-for="(item, it) in items" :key="item.idProducto">
                <tr>
                  <td class="text-center">{{ it + 1 }}</td>
                  <td class="text-center">{{ item.idProducto }}</td>
                  <td class="text-left">{{ item.nombre_Producto }}</td>
                  <td class="text-left">{{ item.precio }}</td>

                  <td class="text-center">
                    <b-card-img :src="url_base + item.rutaImagen"></b-card-img>
                  </td>

                  <td class="text-center">
                    <!-- <b-button>
                            Editar
                        </b-button> -->
                    <b-button
                      variant="primary"
                      size="sm"
                      class="m-1"
                      @click="Editar(item.idProducto)"
                    >
                      Editar</b-button
                    >

                    <!-- <b-dropdown bloque size="sm" text="Acciones" right>
                        <b-dropdown-item v-if="Permission('ProductEdit')" @click="EditProduct(item.id_product)">Editar</b-dropdown-item>
                        <b-dropdown-item v-if="Permission('ProductView')" @click="ViewProduct(item.id_product)">Ver</b-dropdown-item>
                        <b-dropdown-item v-if="Permission('ProductDelete')" @click="ConfirmDeleteProduct(item.id_product)">Eliminar</b-dropdown-item>
                      </b-dropdown>
                       -->
                  </td>
                </tr>
              </tbody>
            </table>
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
        { label: "Nombre ", key: "nombre" },
        { label: "Acciones", key: "acciones", sortable: false },
      ],
      items: [],
      url_base: "https://localhost:44357/",
      Buscar: "",
      DialogCliente: false,
    };
  },
  created() {},
  mounted() {
    this.GetProductos();
  },
  methods: {
    Nuevo() {
      this.$router.push({ name: "ProductoAdd" });
    },
    GetProductos() {
      let me = this;
      axios({
        method: "get",
        url: "Producto/GetProductoAll",
      })
        .then((response) => {
          //  console.log(response)
          me.items = response.data;
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    Editar(id) {
      alert(id);
      // this.$router.push({ name: "FrecuenciaEdit",params:{id:id} });
    },
  },
};
</script>
