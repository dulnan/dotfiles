<template>
  <div v-show="listVisible" class="themes-list">
    <ul class="list">
      <li v-for="theme in themes" :key="theme.name">
        <theme-preview
          :name="theme.name"
          :colorscheme="getColorscheme(theme.data.colorscheme)"
          :background="theme.data.wallpaper"
          :modified="theme.modified"
        />
      </li>
    </ul>
  </div>
</template>

<script>
import { mapState } from 'vuex'

import ThemePreview from '@/components/ThemePreview.vue'

export default {
  name: 'Themes',

  components: {
    ThemePreview,
  },

  data () {
    return {
      listVisible: true
    }
  },

  computed: {
    ...mapState([
      'themes',
      'activeColors',
      'colorschemes',
    ]),
  },

  watch: {
  },

  methods: {
    handleSelectInput (e) {
      this.$store.dispatch('setActiveColorschemeByName', e.target.value)
    },
    getColorscheme (name) {
      const colorscheme = this.colorschemes.filter(c => c.name === name)

      if (colorscheme.length > 0) {
        return colorscheme[0]
      }

      return null
    }
  },

  mounted () {
  }
}
</script>

<style scoped lang="scss">
.themes-list {
  li {
    margin-bottom: 2rem;
  }
}
</style>
