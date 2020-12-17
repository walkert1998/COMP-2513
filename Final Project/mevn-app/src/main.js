import { createApp } from 'vue'
import App from './App.vue'
import './registerServiceWorker'
import router from './router'
import store from './store'

import './custom.scss'

import 'bootstrap/dist/css/bootstrap.min.css'

window.$ = require('jquery')
window.JQuery = require('jquery')

createApp(App).use(store).use(router).mount('#app')
