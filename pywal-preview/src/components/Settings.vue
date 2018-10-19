<template>
  <div class="storage">
    <select :value="colorschemes" @input="handleSelectInput">
      <option v-for="colorscheme in colorschemes" :value="colorscheme.name" :key="colorscheme.name">
        {{ colorscheme.name }}
      </option>
    </select>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'Settings',

  computed: {
    ...mapState([
      'colorschemes'
    ])
  },

  watch: {
  },

  methods: {
    handleSelectInput (e) {
      this.$store.dispatch('setActiveColorschemeByName', e.target.value)
    }
  },

  mounted () {
  }
}
</script>

<style lang="scss">
.storage {
  padding: 1rem;
}
</style>
