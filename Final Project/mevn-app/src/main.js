import { createApp } from 'vue'
import App from './App.vue'
import './registerServiceWorker'
import router from './router'
import store from './store'

import './custom.scss'

window.$ = require('jquery')
window.JQuery = require('jquery')

createApp(App).use(store).use(router).mount('#app')
