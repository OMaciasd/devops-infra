<template>
  <div>
    <h2>User Profile</h2>
    <p>Welcome, {{ user.name }}!</p>
    <button @click="logout">Logout</button>
  </div>
</template>

<script>
export default {
  computed: {
    user() {
      return this.$store.state.user  // Accede al estado del usuario desde Vuex
    }
  },
  methods: {
    logout() {
      this.$store.dispatch('logout')  // Limpia el estado del usuario
      this.$router.push('/login')  // Redirige a la página de login
    }
  }
}
</script>

<style scoped>
button {
  margin: 10px;
  padding: 10px;
  font-size: 16px;
  cursor: pointer;
}
</style>
