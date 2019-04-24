<template>
  <div class="polybar-container">
    <polybar-bar v-for="bar in bars" :bar="bar" :key="bar.name" />
  </div>
</template>

<script>
import PolybarBar from './PolybarBar.vue'

export default {
  name: 'Polybar',

  components: {
    PolybarBar
  },

  props: {
    colorscheme: Object
  },

  data () {
    return {
    }
  },

  computed: {
    activePolybar () {
      const activePolybar = this.$store.getters.getActivePolybar
      if (activePolybar) {
        return activePolybar.data
      }
    },

    bars () {
      if (this.activePolybar && this.activePolybar.bar) {
        return this.activePolybar.bar
      }

      return []
    }
  },

  methods: {
  }
}
</script>

<style lang="scss">
.polybar-container {
  background: currentColor;
}

.polybar-list {
  list-style-type: none;
  margin: 0;
  padding: 0;
  display: flex;
}

.polybar {
  padding: 1rem;
  display: flex;
}

.polybar__area--right {
  margin-left: auto;
}


</style>
