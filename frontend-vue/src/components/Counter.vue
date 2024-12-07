<template>
 <div>
   <h2>Counter: {{ count }}</h2>
   <button @click="increment">Increment</button>
   <button @click="decrement">Decrement</button>
 </div>
</template>

<script>
export default {
 computed: {
   // Acceder al estado global 'count' de Vuex
   count() {
     return this.$store.state.count
   }
 },
 methods: {
   // Llamar a las acciones de Vuex para cambiar el estado
   increment() {
     this.$store.dispatch('increment')
   },
   decrement() {
     this.$store.dispatch('decrement')
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

h2 {
 color: #42b983;
}
</style>
