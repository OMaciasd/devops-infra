<template>
 <div>
   <h2>{{ title }}</h2>
   <p>{{ description }}</p>
 </div>
</template>

<script>
export default {
 name: 'MyComponent',
 props: {
   title: String,
   description: String,
 }
}
</script>

<style scoped>
h2 {
 color: #42b983;
}
</style>
