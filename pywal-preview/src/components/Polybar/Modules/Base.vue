<template>
  <div class="polybar-module polybar-module--cpu">
    <polybar-label :text="'A'" />
  </div>
</template>

<script>
import PolybarLabel from '@/components/Polybar/Modules/Label.vue'

export default {
  name: 'PolybarModuleBase',

  components: {
    PolybarLabel
  },

  props: {
    module: Object
  },

  data () {
    return {
    }
  },

  computed: {
  },

  methods: {
  }
}
</script>

<style lang="scss">
.polybar-module {
}
</style>
