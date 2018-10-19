<template>
  <div class="polybar-bar__module">
    <component v-if="isSupported" :is="'cpu'" :module="module" />
    <div v-else>nope</div>
  </div>
</template>

<script>
import cpu from '@/components/Polybar/Modules/Type/cpu.vue'

export default {
  name: 'PolybarModule',

  components: {
    cpu
  },

  props: {
    module: Object
  },

  data () {
    return {
    }
  },

  computed: {
    type () {
      return this.module.config.type.split('/')[1]
    },
    isSupported () {
      return this.type === 'cpu'
    }
  },

  methods: {
  }
}
</script>

<style lang="scss">
.polybar-bar__module {
  margin: 0 8px;
}
</style>
