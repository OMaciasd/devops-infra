import { createRouter, createWebHistory } from 'vue-router'
import store from '../store'  // Importa Vuex para verificar el estado del usuario
import Login from '../views/Login.vue'
import Home from '../views/Home.vue'
import About from '../views/About.vue'
import Contact from '../views/Contact.vue'

const routes = [
  { path: '/login', component: Login },  // Ruta de login, siempre accesible
  {
    path: '/',
    component: Home,
    meta: { requiresAuth: true }  // Requiere autenticación
  },
  {
    path: '/about',
    component: About,
    meta: { requiresAuth: true }  // Requiere autenticación
  },
  {
    path: '/contact',
    component: Contact,
    meta: { requiresAuth: true }  // Requiere autenticación
  },
  { path: '/:pathMatch(.*)*', redirect: '/login' }  // Redirige rutas no válidas a login
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

// Guard de navegación global
router.beforeEach((to, from, next) => {
  if (to.meta.requiresAuth && !store.state.user) {
    // Si la ruta requiere autenticación y no hay usuario autenticado, redirige a login
    next('/login')
  } else {
    // De lo contrario, permite la navegación
    next()
  }
})

export default router
