import Vue from 'vue';
import DashboardPlugin from './plugins/dashboard-plugin';
import App from './App.vue';
import axios from 'axios';
import store from "./store";
// router setup
import router from './routes/router';
import VueSession from 'vue-session'

import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

// plugin setup
Vue.use(DashboardPlugin);
Vue.use(VueSweetalert2);
Vue.use(VueSession)

axios.defaults.baseURL = 'https://localhost:44357/'
    /* eslint-disable no-new */
new Vue({
    el: '#app',
    render: h => h(App),
    router,
    store
});