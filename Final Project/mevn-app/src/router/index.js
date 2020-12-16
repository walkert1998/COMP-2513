import { createRouter, createWebHashHistory } from 'vue-router'
import Home from '../views/Home.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/bookList',
    name: 'BookList',
    component: () => import('../views/BookList.vue')
  },
  {
    path: '/weather',
    name: 'Weather',
    component: () => import('../views/Weather.vue')
  },
  {
    path: '/map',
    name: 'Map',
    component: () => import('../views/Map.vue')
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import('../views/About.vue')
  }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

export default router
