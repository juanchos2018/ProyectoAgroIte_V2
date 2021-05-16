import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'

Vue.use(Router)

export default new Router({
    mode: 'hash',
    base: process.env.BASE_URL,
    routes: [{
        path: '/',
        name: 'home',
        component: Home
    },   
   
    {
        path: '/nosotros',
        name: 'nosotros',
        component: () => import('./views/nosotros/Nosotros.vue')
    },
    {
        path: '/registro',
        name: 'registro',
        component: () => import('./views/registro/Registro.vue')
    },
    {
        path: '/login',
        name: 'login',
        component: () => import('./views/login/Login.vue')
    },
    {
        path: '/menu',
        name: 'menu',
        component: () => import('./views/menu/Menu.vue')
    },  
    
    ]
})
