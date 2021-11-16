import Vue from 'vue'
import Vuex from 'vuex'

import decode from 'jwt-decode'
Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        cartProducts: [],
        products: [],
        carrito: [],
        loggedUser: {},
        token: null,
        total: 0,
        canttotal: 0,
        usuario: null,
        nombreUsuario: '',
        idUsuario: '',
        etiquetaSalir: false,
        etiquetaIniciar: true,
        etiquetaNombre: false

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
            state.etiquetaSalir = data.etiquetaSalir
            state.etiquetaIniciar = data.etiquetaIniciar
            state.etiquetaNombre = data.etiquetaNombre
        },
        EstadoNoLogueado: (state, data) => {
            state.etiquetaSalir = data.etiquetaSalir
            state.etiquetaIniciar = data.etiquetaIniciar
            state.etiquetaNombre = data.etiquetaNombre
        },
        SET_CART_PRODUCTS: (state, products) => {
            state.cartProducts = []
            state.cartProducts = products
        },
        setToken(state, token) {
            state.token = token
        },
        setUsuario(state, nombreUsuario) {
            state.nombreUsuario = nombreUsuario
        },
        destroyToken(state) {
            state.token = null
        },
        agregar(state, data) {
            var co = '';
            var exite = false;
            for (let i = 0; i < state.products.length; i++) {
                if (state.products[i].codigo == data.codigo) {
                    exite = true;
                    co = state.products[i].codigo;
                    break;
                }
            }
            if (exite == true) {
                let objIndex = state.products.findIndex(obj => obj.codigo == co);
                state.products[objIndex].Cantidad = state.products[objIndex].Cantidad + data.Cantidad;
                state.products[objIndex].Total = state.products[objIndex].Total * state.products[objIndex].Cantidad;

            } else {
                state.products.push({
                    codigo: data.codigo,
                    Descripcion: data.Descripcion,
                    Precio: data.Precio,
                    Cantidad: data.Cantidad,
                    Total: data.Total,
                    photo: data.photo

                })
            }
        },
        addCart(state, data) {
            var co = '';
            var exite = false;
            for (let i = 0; i < state.carrito.length; i++) {
                if (state.carrito[i].id_product == data.id_product) {
                    exite = true;
                    co = state.carrito[i].id_product;
                    break;
                }
            }
            if (exite == true) {
                let objIndex = state.carrito.findIndex(obj => obj.id_product == co);
                state.carrito[objIndex].quantity = state.carrito[objIndex].quantity + data.quantity;
                state.carrito[objIndex].total_price = state.carrito[objIndex].total_price * state.carrito[objIndex].quantity;

            } else {
                state.carrito.push({
                    id_product: data.id_product,
                    Descripcion: data.Descripcion,
                    unit_price: data.unit_price,
                    quantity: data.quantity,
                    total_price: data.total_price,
                    photo: data.photo,
                    state: data.state

                })
            }

        },
        deletItemCart: (state, data) => {
            state.carrito = state.carrito.filter(book => book.id_product !== data.id_product)
        },
        total: (state) => {
            state.total = state.carrito.reduce((acc, item) => acc + parseInt(item.total_price), 0);
        },
        cantTotal: (state) => {
            state.canttotal = state.carrito.reduce((acc, item) => acc + parseInt(item.quantity), 0);
        },
    },
    actions: {
        guardarToken({ commit }, token) {
            commit("setToken", token)
            commit("setUsuario", decode(token))
            localStorage.setItem("token", token)
        },
    }
})