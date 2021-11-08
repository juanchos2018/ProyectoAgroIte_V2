import Vue from 'vue';
import Router from 'vue-router';

import Layout from '@/components/Layout/Layout';
import Login from '@/pages/Login/Login';

import ErrorPage from '@/pages/Error/Error';
// Main
import AnalyticsPage from '@/pages/Dashboard/Dashboard';

import Publicaciones from '@/pages/Publicaciones/Publicaciones';
import PublicacionesLista from '@/pages/Publicaciones/PublicacionesLista';

import Registro from '@/pages/Registro/Registro';
import RegistroEmpresa from '@/pages/Registro/RegistroEmpresa';
import Chat from '@/pages/Chat/Chat';

import Solicitudes from '@/pages/Solicitudes/Solicitudes';
import Taxista from '@/pages/Taxista/Taxista';
import TaxistaDetalle from '@/pages/Taxista/TaxistaDetalle';

//Nuevas Rutas


import ActividadList from '@/pages/Actividad/ActividadList';
import ActividadAdd from '@/pages/Actividad/ActividadAdd';



import UsuarioList from '@/pages/Usuario/UsuarioList';
import UsuarioAdd from '@/pages/Usuario/UsuarioAdd';


import AsociacionList from '@/pages/Asociacion/AsociacionList';
import AsociacionAdd from '@/pages/Asociacion/AsociacionAdd';

Vue.use(Router);

//952341137  


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
            path: '/registro',
            name: 'Registro',
            component: RegistroEmpresa,
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
                    path: 'chat/:id_usuario',
                    name: 'chat',
                    component: Chat,
                },
                {
                    path: 'publicaciones',
                    name: 'publicaciones',
                    component: Publicaciones,
                },
                {
                    path: 'publicacioneslista',
                    name: 'publicacioneslista',
                    component: PublicacionesLista,
                },
                {
                    path: 'taxistas',
                    name: 'taxistas',
                    component: Taxista,
                },
                {
                    path: 'taxistas',
                    name: 'taxistas',
                    component: Taxista,
                },
                { //  path: 'preventa/PreventaDetalle/:id',
                    path: 'taxistasdetalle/:id_usuario',
                    name: 'taxistasdetalle',
                    component: TaxistaDetalle,
                },
                {
                    path: 'Solicitudes/:id',
                    name: 'Solicitudes',
                    component: Solicitudes,
                },
                //Nuevas Rutas


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

            ],
        },
    ],
});