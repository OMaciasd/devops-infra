<template>
 <div>
   <h2>Login</h2>
   <p>Please log in to continue.</p>
   <button @click="login">Login</button>
 </div>
</template>

<script>
export default {
 methods: {
   login() {
     const mockUser = { name: 'John Doe' }  // Simulación de un usuario
     this.$store.dispatch('setUser', mockUser)  // Llama la acción para establecer el usuario
     this.$router.push('/')  // Redirige a Home después de iniciar sesión
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
