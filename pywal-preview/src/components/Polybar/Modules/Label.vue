<template>
  <div class="polybar-module-label">
    {{ text }}
  </div>
</template>

<script>
export default {
  name: 'PolybarModuleLabel',

  props: {
    text: String,
    format: {
      type: Object,
      default: () => {
        return {
          font: '',
          foreground: '',
          background: '',
          underline: '',
          overline: '',
          paddingLeft: 0,
          paddingRight: 0,
          marginLeft: 0,
          marginRight: 0,
          spacing: 0,
          offset: 0
        }
      }
    },
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
