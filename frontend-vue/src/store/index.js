import { createStore } from 'vuex'

export default createStore({
  state: {
    user: null  // Estado del usuario
  },
  mutations: {
    setUser(state, user) {
      state.user = user  // Establece el usuario
    },
    clearUser(state) {
      state.user = null  // Limpia el estado del usuario
    }
  },
  actions: {
    setUser({ commit }, user) {
      commit('setUser', user)  // Acción para login
    },
    logout({ commit }) {
      commit('clearUser')  // Acción para logout
    }
  }
})
