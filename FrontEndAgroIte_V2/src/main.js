import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import VueAwesomeSwiper from "vue-awesome-swiper";
import NProgress from "nprogress";
import { BootstrapVue,VBHoverPlugin,IconsPlugin   } from 'bootstrap-vue'
// require styles
import "swiper/swiper.min.css";
import "../node_modules/nprogress/nprogress.css";
import VueSweetalert2 from 'vue-sweetalert2'; 
import 'sweetalert2/dist/sweetalert2.min.css';
import VueSession from 'vue-session'
import "@/assets/style/global.css"

Vue.use(VueSweetalert2);
Vue.use(VueAwesomeSwiper);
Vue.use(BootstrapVue);
Vue.use(VBHoverPlugin)
Vue.use(VueSession)
Vue.use(IconsPlugin)
Vue.config.productionTip = false;


Vue.mixin({
  data: function() {
    return {
      get RutaNetCore() {
        // servidor       
          //return "http://192.168.1.11:8081/apixml2/";
         //local
         return "http://localhost:8085/";         
      },
      get RutaApiReniec(){
           return "http://aveoperu.com/dniconsulta/";             
      },
     
    }
  }
})



router.beforeResolve((to, from, next) => {
  if (to.name) {
    NProgress.start();
  }
  next();
});

router.afterEach(() => {
  NProgress.done();
});
// eslint-disable-next-line no-unused-vars
let vm = new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
