<template>
  <div class="background">
    <ul class="list background-list">
      <li v-for="image in wallpapers" :key="image">
        <button
          class="button wallpaper material"
          :style="{ 'backgroundImage': buildBackgroundValue(image) }"
          @click="handleBackgroundClick(image)"
        ></button>
      </li>
    </ul>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  name: 'Background',

  components: {
    // Color
  },

  computed: {
    ...mapState([
      'wallpapers'
    ])
  },

  methods: {
    buildBackgroundValue (name) {
      return `url(/wallpapers/${name})`
    },
    handleBackgroundClick (name) {
      this.$store.commit('updateActiveWallpaper', name)
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.background-list {
  li {
    padding: 1rem;
  }
}

.wallpaper {
  background-size: cover;
  height: 10rem;
  display: block;
  width: 100%;
}
</style>
