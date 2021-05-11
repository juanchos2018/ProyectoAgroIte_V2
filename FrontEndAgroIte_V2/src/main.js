import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import "./registerServiceWorker";
import VueAwesomeSwiper from "vue-awesome-swiper";
import NProgress from "nprogress";
import { BootstrapVue,VBHoverPlugin  } from 'bootstrap-vue'
// require styles
import "swiper/swiper.min.css";
import "../node_modules/nprogress/nprogress.css";
import VueSweetalert2 from 'vue-sweetalert2'; 
import 'sweetalert2/dist/sweetalert2.min.css';


Vue.use(VueSweetalert2);
Vue.use(VueAwesomeSwiper);
Vue.use(BootstrapVue);
Vue.use(VBHoverPlugin)
Vue.config.productionTip = false;


Vue.mixin({
  data: function() {
    return {
      get RutaNetCore() {
        // servidor       
          //return "http://192.168.1.11:8081/apixml2/";
         //local
         return "https://localhost:44357/";         
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
