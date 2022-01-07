import DashboardLayout from '@/views/Layout/DashboardLayout.vue';
import AuthLayout from '@/views/Pages/AuthLayout.vue';

import NotFound from '@/views/NotFoundPage.vue';


const routes = [{
        path: '/',
        redirect: 'dashboard',
        component: DashboardLayout,
        children: [{
                path: '/dashboard',
                name: 'dashboard',
                // route level code-splitting
                // this generates a separate chunk (about.[hash].js) for this route
                // which is lazy-loaded when the route is visited.
                component: () =>
                    import ( /* webpackChunkName: "demo" */ '../views/Dashboard.vue')
            },
            {
                path: '/icons',
                name: 'icons',
                component: () =>
                    import ( /* webpackChunkName: "demo" */ '../views/Icons.vue')
            },
            {
                path: '/profile',
                name: 'profile',
                component: () =>
                    import ( /* webpackChunkName: "demo" */ '../views/Pages/UserProfile.vue')
            },
            {
                path: '/maps',
                name: 'maps',
                component: () =>
                    import ( /* webpackChunkName: "demo" */ '../views/GoogleMaps.vue')
            },
            {
                path: '/tables',
                name: 'tables',
                component: () =>
                    import ( /* webpackChunkName: "demo" */ '../views/RegularTables.vue')
            },
            {
                path: '/actividad',
                name: 'Actividad',
                component: () =>
                    import ('../views/Actividad/ActividadList.vue')
            },
            {
                path: '/actividadadd',
                name: 'ActividadAdd',
                component: () =>
                    import ('../views/Actividad/ActividadAdd.vue')
            },
            {
                path: '/actividadedit/:id',
                name: 'ActividadEdit',
                props: true,
                component: () =>
                    import ('../views/Actividad/ActividadEdit.vue')
            },
            {
                path: '/usuarios',
                name: 'Usuarios',
                component: () =>
                    import ('../views/Usuario/UsuarioList.vue')
            },

            {
                path: '/usuariosadd',
                name: 'UsuarioAdd',
                component: () =>
                    import ('../views/Usuario/UsuarioAdd.vue')
            },

            {
                path: '/usuariover/:idusuario',
                name: 'UsuarioVer',
                props: true,
                component: () =>
                    import ('../views/Usuario/UsuarioVer.vue')
            },
            {
                path: '/usuarioedit/:idusuario',
                name: 'UsuarioEdit',
                props: true,
                component: () =>
                    import ('../views/Usuario/UsuarioEdit.vue')
            },

            {
                path: '/categorias',
                name: 'Categoria',
                component: () =>
                    import ('../views/Categoria/CategoriaList.vue')
            },

            {
                path: '/categoriaadd',
                name: 'CategoriaAdd',
                component: () =>
                    import ('../views/Categoria/CategoriaAdd.vue')
            },


            {
                path: '/categoriaedit/:id',
                name: 'CategoriaEdit',
                props: true,
                component: () =>
                    import ('../views/Categoria/CategoriaEdit.vue')
            },

            {
                path: '/frecuencialist',
                name: 'FrecuenciaList',
                component: () =>
                    import ('../views/Frecuencia/FrecuenciaList.vue')
            },
            {
                path: '/frecuenciaadd',
                name: 'FrecuenciaAdd',
                component: () =>
                    import ('../views/Frecuencia/FrecuenciaAdd.vue')
            },
            {
                path: '/frecuenciaedit/:id',
                name: 'FrecuenciaEdit',
                props: true,
                component: () =>
                    import ('../views/Frecuencia/FrecuenciaEdit.vue')
            },


            //productos
            {
                path: '/productolist',
                name: 'ProductoList',
                component: () =>
                    import ('../views/Producto/ProductoList.vue')
            },
            {
                path: '/productoadd',
                name: 'ProductoAdd',
                component: () =>
                    import ('../views/Producto/ProductoAdd.vue')
            },
            {
                path: '/productoedit/:id',
                name: 'ProductoEdit',
                props: true,
                component: () =>
                    import ('../views/Producto/ProductoEdit.vue')
            },

        ]
    },
    {
        path: '/',
        redirect: 'login',
        component: AuthLayout,
        children: [{
                path: '/login',
                name: 'login',
                component: () =>
                    import ( /* webpackChunkName: "demo" */ '../views/Pages/Login.vue')
            },
            {
                path: '/register',
                name: 'register',
                component: () =>
                    import ( /* webpackChunkName: "demo" */ '../views/Pages/Register.vue')
            },
            { path: '*', component: NotFound }
        ]
    }
];

export default routes;