<template>
  <div id="app">
    <h1>Welcome to Vuex Auth Example</h1>
    <div v-if="user" class="navigation">
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link> |
      <router-link to="/contact">Contact</router-link>
    </div>

    <!-- Renderiza el perfil del usuario si está autenticado -->
    <UserProfile v-if="user" />

    <!-- Renderiza las vistas según las rutas -->
    <router-view></router-view>
  </div>
</template>

<script>
import UserProfile from './components/UserProfile.vue'

export default {
  name: 'App',
  components: {
    UserProfile
  },
  computed: {
    user() {
      return this.$store.state.user  // Accede al estado del usuario
    }
  }
}
</script>

<style scoped>
/* Estilo simple */
.navigation {
  margin: 20px;
  font-size: 18px;
}

.navigation router-link {
  color: #42b983;
  text-decoration: none;
}

.navigation router-link:hover {
  color: #345;
}
</style>
