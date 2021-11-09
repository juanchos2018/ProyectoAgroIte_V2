import Vue from 'vue';
import Router from 'vue-router';

import Layout from '@/components/Layout/Layout';
import Login from '@/pages/Login/Login';

import ErrorPage from '@/pages/Error/Error';
// Main
import AnalyticsPage from '@/pages/Dashboard/Dashboard';
//Nuevas Rutas
import ActividadList from '@/pages/Actividad/ActividadList';
import ActividadAdd from '@/pages/Actividad/ActividadAdd';

import UsuarioList from '@/pages/Usuario/UsuarioList';
import UsuarioAdd from '@/pages/Usuario/UsuarioAdd';

import AsociacionList from '@/pages/Asociacion/AsociacionList';
import AsociacionAdd from '@/pages/Asociacion/AsociacionAdd';

import CategoriaList from '@/pages/Categoria/CategoriaList';
import CategoriaAdd from '@/pages/Categoria/CategoriaAdd';

import FrecuenciaList from '@/pages/Frecuencia/FrecuenciaList';
import FrecuenciaAdd from '@/pages/Frecuencia/FrecuenciaAdd';

import UnidadVolumenList from '@/pages/UnidadVolumen/UnidadVolumenList';
import UnidadVolumenAdd from '@/pages/UnidadVolumen/UnidadVolumenAdd';

import ProductoAdd from '@/pages/Producto/ProductoAdd'
import ProductoList from '@/pages/Producto/ProductoList'

Vue.use(Router);
export default new Router({
    routes: [{
            path: '/login',
            name: 'Login',
            component: Login,
        },
        {
            path: '/error',
            name: 'Error',
            component: ErrorPage,
        },
        
        {
            path: '/app',
            name: 'Layout',
            component: Layout,
            children: [{
                    path: 'inicio',
                    name: 'AnalyticsPage',
                    component: AnalyticsPage,
                },
            
                {
                    path: 'actividadlist',
                    name: 'Actividad',
                    component: ActividadList,
                },
                {
                    path: 'actividadadd',
                    name: 'ActividadAdd',
                    component: ActividadAdd,
                },

                {
                    path: 'usuariolist',
                    name: 'Usuario',
                    component: UsuarioList,
                },
                {
                    path: 'usuarioadd',
                    name: 'UsuarioAdd',
                    component: UsuarioAdd,
                },

                {
                    path: 'asociacionlist',
                    name: 'Asociacion',
                    component: AsociacionList,
                },
                {
                    path: 'asociacionadd',
                    name: 'Asociacion',
                    component: AsociacionAdd,
                },
                {
                    path: 'categorialist',
                    name: 'Categoria',
                    component: CategoriaList,
                },
                {
                    path: 'categoriaadd',
                    name: 'Categoria',
                    component: CategoriaAdd,
                },
                {
                    path: 'frecuencialist',
                    name: 'Frecuencia',
                    component: FrecuenciaList,
                },
                {
                    path: 'frecuenciaadd',
                    name: 'FrecuenciaAdd',
                    component: FrecuenciaAdd,
                },
                {
                    path: 'unidadvolumenlist',
                    name: 'UnidadVolumen',
                    component: UnidadVolumenList,
                },
                {
                    path: 'unidadvolumenadd',
                    name: 'UnidadVolumenAdd',
                    component: UnidadVolumenAdd,
                },
                {
                    path: 'productolist',
                    name: 'Producto',
                    component:ProductoList,
 
                },
                {
                    path: 'productoadd',
                    name: 'ProductoAdd',
                    component:ProductoAdd,
                },

            ],
        },
    ],
});