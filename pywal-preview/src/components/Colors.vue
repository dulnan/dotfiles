<template>
  <div class="colors">
    <ul class="list colors-list">
      <li v-for="(color, index) in activeColors" :key="color.name" class="colors-list__item">
        <color :color="color" :key="index" />
      </li>
    </ul>
  </div>
</template>

<script>
import { mapState } from 'vuex'

import Color from '@/components/Color.vue'

export default {
  name: 'Colors',

  components: {
    Color,
  },

  data () {
    return {
    }
  },

  computed: {
    ...mapState([
      'activeColors',
      'activeColorscheme'
    ])
  },

  methods: {
  }
}
</script>

<style scoped lang="scss">
.colors {
  position: relative;
  min-width: 16rem;
  height: 100%;
}

.colors-list {
  position: absolute;
  top: 0.5rem;
  left: 0.5rem;
  bottom: 0.5rem;
  right: 0.5rem;
  z-index: 5;
  display: flex;
  flex-direction: column;
}

.colors-list__item {
  overflow: hidden;
  flex: 1 0 2rem;
}

</style>
