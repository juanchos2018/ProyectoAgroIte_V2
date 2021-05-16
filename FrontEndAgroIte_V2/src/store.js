import Vue from 'vue'
import Vuex from 'vuex'

import decode from 'jwt-decode'
Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        cartProducts: [],
        loggedUser: {},
        token: null,
        usuario: null,
        nombreUsuario:'',
        idUsuario:'',
        etiquetaSalir:false,
        etiquetaIniciar:true,
        etiquetaNombre:false

    },

    getters: {
        cartProducts: state => {
            return state.cartProducts
        },
        getLoggedUser: state => {
            return state.loggedUser
        }
    },
    mutations: {

        EstadoLogueado: (state, data) => {
            state.etiquetaSalir=data.etiquetaSalir
            state.etiquetaIniciar=data.etiquetaIniciar
            state.etiquetaNombre=data.etiquetaNombre            
        },
        EstadoNoLogueado: (state, data) => {
            state.etiquetaSalir=data.etiquetaSalir
            state.etiquetaIniciar=data.etiquetaIniciar
            state.etiquetaNombre=data.etiquetaNombre               
        },
        
       

        SET_CART_PRODUCTS: (state, products) => {
            state.cartProducts = []
            state.cartProducts = products
        },
        setToken(state,token){
            state.token=token
          },
        setUsuario(state,nombreUsuario){
            state.nombreUsuario=nombreUsuario
          },
         destroyToken(state) {
            state.token = null
          },
    },
    actions: {
        guardarToken({commit},token){
            commit("setToken", token)
            commit("setUsuario", decode(token))
            localStorage.setItem("token", token)   
          },
    }
})