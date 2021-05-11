import Vue from 'vue'
import Vuex from 'vuex'
import {
    encryptUser
} from './components/shared/service/authService'
import decode from 'jwt-decode'
Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        cartProducts: [],
        loggedUser: {},
        token: null,
        usuario: null,
        nombreUsuario:'',
        idUsuario:''

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
        ADD_CART_LOCAL: (state, product) => {
            state.cartProducts.push(product)
            localStorage.setItem('iki-cart', JSON.stringify(state.cartProducts))
        },

        ADD_LOGGED_USER: (state, user) => {
            state.loggedUser = user
            localStorage.setItem('_auth', encryptUser(user))
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