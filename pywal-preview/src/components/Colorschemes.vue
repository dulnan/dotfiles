<template>
    <div class="colorschemes">
      <ul class="list list--divided">
        <li v-for="colorscheme in colorschemes" :key="colorscheme.name" class="colorschemes__item">
          <colorscheme-item :colorscheme="colorscheme" />
        </li>
      </ul>
    </div>
</template>

<script>
import { mapState } from 'vuex'

import ColorschemeItem from '@/components/ColorschemeItem.vue'

export default {
  name: 'Colorschemes',

  components: {
    ColorschemeItem,
  },

  computed: {
    ...mapState([
      'activeColors',
      'colorschemes',
      'activeColorscheme'
    ])
  },

  methods: {
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">

</style>
