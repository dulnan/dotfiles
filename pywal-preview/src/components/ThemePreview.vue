<template>
  <button class="button theme" @click="setActiveTheme">
    <div class="theme__preview material" :style="{ backgroundImage: `url(/wallpapers/${background})` }">
      <div class="theme__window">
        <colorscheme-preview :colorscheme="colorscheme" />
      </div>
    </div>

    <div class="theme__name">{{ name }}</div>
    <div class="icon-text text-muted">
      <div class="icon-text__icon">
        <icon-time />
      </div>
      <div class="icon-text__text">
        <timeago :datetime="modified" />
      </div>
    </div>
  </button>
</template>

<script>
import { mapState } from 'vuex'
import ColorschemePreview from '@/components/ColorschemePreview'
import IconTime from '@/assets/icon-time.svg'

export default {
  name: 'ThemePreview',

  components: {
    ColorschemePreview,
    IconTime
  },

  props: {
    name: String,
    colorscheme: Object,
    background: String,
    modified: ''
  },

  computed: {
    ...mapState([
      'colors'
    ]),
  },

  watch: {
  },

  methods: {
    getStyle (type, name) {
      return {
        fill: this.colorscheme.data[type][name]
      }
    },
    getWindowStyle () {
      return {
        backgroundColor: this.colorscheme.data.special.background,
        color: this.colorscheme.data.special.foreground
      }
    },
    setActiveTheme () {
      this.$store.dispatch('setActiveTheme', this.name)
      this.$store.dispatch('setActiveColorscheme', this.colorscheme.name)
      this.$store.dispatch('setActiveWallpaper', this.background)
    }
  },

  mounted () {
  }
}
</script>

<style scoped lang="scss">
.theme {
  width: 100%;
  text-align: left;
  position: relative;
  padding: 1rem 2rem;
  perspective: 800px;
  transform-style: preserve-3d;
  overflow: hidden;
  &:hover {
    .theme__preview {
      transform: rotate3d(4,4,0,10deg) translateZ(1rem);
      box-shadow: 0 4px 18px 0px rgba(#000, 0.3);
      &:before {
        transform: scale(1.2) translate(2rem, 2rem);
      }
    }
  }
  .list {
    display: flex;
    flex-wrap: wrap;
    li {
      display: block;
      height: 18px;
      flex: 0 0 18px;
      margin-right: 4px;
      margin-bottom: 4px;
    }
  }
}

.theme__name {
  font-weight: bold;
  margin-top: 1rem;
}

.theme__preview {
  position: relative;
  background-size: cover;
  padding: 1rem;
  transition: 0.3s;
  transform-style: preserve-3d;
  &:before {
    content: "";
    position: absolute;
    top: -2rem;
    left: -3rem;
    bottom: 0;
    right: 0;
    transition: 0.3s;
    background: radial-gradient(circle closest-side, rgba(white, 0.2), rgba(white, 0));
    transform: translate(1px,1px);
  }
}

.theme__window {
  padding: 0.5rem;
  display: inline-block;
  transform: translateZ(5rem);
}
</style>
