import Vue from 'vue'
import App from './App.vue'

import store from './store'

import VueHighlightJS from 'vue-highlightjs'
import VueLocalStorage from 'vue-localstorage'
import axios from 'axios'
import VueAxios from 'vue-axios'
import VueTimeago from 'vue-timeago'

Vue.use(VueTimeago, {
  name: 'Timeago', // Component name, `Timeago` by default
  locale: 'en', // Default locale
})

Vue.use(VueAxios, axios)
Vue.axios.defaults.baseURL = 'http://localhost:8081'

Vue.use(VueHighlightJS)
Vue.use(VueLocalStorage, {
  name: 'storage'
})

Vue.config.productionTip = false

new Vue({
  store,
  render: h => h(App)
}).$mount('#app')
