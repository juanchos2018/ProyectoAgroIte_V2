import Vue from 'vue';
import { BootstrapVue, BootstrapVueIcons } from 'bootstrap-vue'
import VueTouch from 'vue-touch';
import store from './store';
import router from './Routes';
import App from './App';
import Widget from './components/Widget/Widget';
import axios from 'axios';
import { moneyfiltro } from '@/filters'
import { VueSpinners } from '@saeris/vue-spinners'
import Chartkick from 'vue-chartkick'
import Chart from 'chart.js'
import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

import VueFileAgent from 'vue-file-agent';
import VueFileAgentStyles from 'vue-file-agent/dist/vue-file-agent.css';

import VueChatScroll from 'vue-chat-scroll'
Vue.use(VueChatScroll)

Vue.use(VueFileAgent);
Vue.use(BootstrapVueIcons)
Vue.use(BootstrapVue);
Vue.use(VueSpinners)
Vue.use(VueTouch);
Vue.use(Chartkick.use(Chart))

Vue.component('Widget', Widget);
Vue.use(require('vue-moment'));
Vue.filter('moneyfiltro', moneyfiltro)
Vue.use(VueSweetalert2);
//Vue.mixin(layoutMixin);
//Vue.use(Toasted, {duration: 10000});  https://localhost:44323/

Vue.config.productionTip = false;
//axios.defaults.baseURL='https://localhost:44358/'

//http://localhost:60080  https://localhost:44323/
axios.defaults.baseURL = 'https://localhost:44357/'
    /* eslint-disable no-new */
new Vue({
    el: '#app',
    store,
    router,
    render: h => h(App),
});