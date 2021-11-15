<template>
  <b-container class="container">
    <br /><br />
    <base-button
      type="primary"
      native-type="submit"
      class="my-4"
      @click="Actividadadd"
      >Nueva Actividad</base-button
    >

    <b-card no-body>
      <br /><br />

      <el-table
        class="table-responsive table"
        header-row-class-name="thead-light"
        :data="items"
      >
        <el-table-column prop="idActividad" label="Codigo" width="180">
        </el-table-column>
        <el-table-column label="Nombre" prop="nombre" min-width="140px">
        </el-table-column>

        <el-table-column align="right">
          <template slot-scope="scope">
            <b-button primary 
            @click="Update(scope.row.idActividad)">Edit</b-button>

            <b-button danger @click="Detele(scope.row.idActividad)"
              >Delete</b-button
            >
          </template>
        </el-table-column>
      </el-table>

      <b-card-footer class="py-4 d-flex justify-content-end">
        <base-pagination
          v-model="currentPage"
          :per-page="10"
          :total="50"
        ></base-pagination>
      </b-card-footer>
    </b-card>
  </b-container>
</template>
<script>
import projects from "@/views/Tables/projects";
import { Table, TableColumn } from "element-ui";
import axios from "axios";
import Swal from "vue-sweetalert2";
export default {
  name: "light-table",
  components: {
    [Table.name]: Table,
    [TableColumn.name]: TableColumn,
  },
  data() {
    return {
      projects,
      currentPage: 1,
      items: [],
      fields: [
        { label: "Codigo", key: "idUsuario", sortable: false },
        { key: "name", label: "Nombre Completo" },
        { label: "Correo", key: "correo", sortable: false },
        { label: "Acciones", key: "acciones", sortable: false },
      ],
    };
  },
  mounted() {
    this.ListarActividades();
  },
  methods: {
    ListarActividades() {
      let me = this;
      axios({
        method: "get",
        url: "Actividad/GetActividad",
      })
        .then((response) => {
          me.items = response.data;
        })
        .catch(function (error) {
          console.log("errorde : " + error);
        });
    },
    Actividadadd() {
      this.$router.push("/actividadadd");
    },
    Update(id){    
     // console.log(id)
      // this.$router.push("/actividadedit");

         this.$router.push({ name: "ActividadEdit",params:{id:id}});

    },
    Detele(id) {
      this.$swal
        .fire({
          title: "Are you sure?",
          text: "You won't be able to revert this!",
          icon: "warning",
          showCancelButton: true,
          confirmButtonColor: "#3085d6",
          cancelButtonColor: "#d33",
          confirmButtonText: "Yes, delete it!",
        })
        .then((result) => {
          if (result.isConfirmed) {
            this.$swal.fire(
              "Deleted!",
              "Your file has been deleted.",
              "success"
            );
          }
        });
    },
  },
};
</script>
