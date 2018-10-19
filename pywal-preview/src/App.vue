<template>
  <div id="app">
    <toolbar />

    <div class="preview" :style="windowsStyle">
      <div class="preview__windows">
        <div class="window">
          <syntax />
        </div>

        <div class="window">
          <colors />
        </div>
      </div>
      <div class="preview__bar">
        <polybar />
      </div>
    </div>

  </div>
</template>

<script>
import { mapState, mapGetters } from 'vuex'

import Syntax from './components/Syntax.vue'
import Colors from './components/Colors.vue'
import Toolbar from './components/Toolbar.vue'
import Polybar from './components/Polybar/Polybar.vue'

export default {
  name: 'app',

  components: {
    Syntax,
    Polybar,
    Colors,
    Toolbar
  },

  data () {
    return {
    }
  },

  computed: {
    windowsStyle() {
      return {
        backgroundImage: `url(/wallpapers/${this.activeWallpaper})`
      }
    },
    ...mapState([
      'activeColors',
      'activeWallpaper',
      'activeColorscheme',
      'activeTheme'
    ]),
    ...mapGetters([
      'contentHasLoaded',
      'getActiveTheme'
    ])
  },

  watch: {
    activeColors: function() {
      this.setCssVariables()
      this.updateState()
    },
    activeWallpaper: function() {
      this.updateState()
    },
    activeColorscheme: function() {
      this.updateState()
    },
    activetheme: function() {
      this.updateState()
    },
    contentHasLoaded: function () {
      this.$store.dispatch('fetchState', { isInitial: true })
    }
  },

  methods: {
    setCssVariables () {
      this.activeColors.forEach(color => {
        document.documentElement.style.setProperty(`--${color.name}`, color.hex)
      })
    },

    updateState () {
      if (this.contentHasLoaded) {
        this.$store.dispatch('saveState')
      }
    }
  },

  mounted () {
    this.$store.dispatch('fetchThemes', { isInitial: true })
    this.$store.dispatch('fetchColorschemes', { isInitial: true })
    this.$store.dispatch('fetchWallpapers', { isInitial: true })
    this.$store.dispatch('fetchPolybars', { isInitial: true })
  }
}
</script>

<style lang="scss">
html {
  font-family: 'Barlow', sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
body {
  padding: 0;
  margin: 0;
}

#app {
  height: 100vh;
  overflow: hidden;
  display: flex;
  flex-direction: column;
}

.preview {
  flex: 1;
  display: flex;
  flex-direction: column;
  height: 100%;
  box-sizing: border-box;
  position: relative;
  background-size: cover;
}

.preview__windows {
  flex: 1;
  display: flex;
  padding: 1rem;
}

.preview__bar {
  flex: 0 0 auto;
}

.window {
  margin-right: 1rem;
  background: var(--background);
  height: 100%;
  overflow: auto;
}

.button {
  border: none;
  margin: 0;
  padding: 0;
  width: auto;
  overflow: visible;
  text-align: left;

  background: transparent;

  cursor: pointer;

  /* inherit font & color from ancestor */
  color: inherit;
  font: inherit;

  /* Normalize `line-height`. Cannot be changed from `normal` in Firefox 4+. */
  line-height: normal;

  /* Corrects font smoothing for webkit */
  -webkit-font-smoothing: inherit;
  -moz-osx-font-smoothing: inherit;

  /* Corrects inability to style clickable `input` types in iOS */
  -webkit-appearance: none;

  /* Remove excess padding and border in Firefox 4+ */
  &::-moz-focus-inner {
    border: 0;
    padding: 0;
  }
  &:focus {
    outline: 0;
  }
}


.list {
  list-style-type: none;
  margin: 0;
  padding: 0;
}

.list--divided {
  > li {
    border-bottom: 1px solid #eee;
    &:last-child {
      border-bottom: 0;
    }
    &:hover {
      //background: #f3f3f3;
    }
  }
}

.text-small {
  font-size: 13px;
}

.text-label {
  text-transform: uppercase;
  letter-spacing: 0.1em;
  font-size: 11px;
  color: #777;
}

.text-muted {
  color: #777;
}

.text-bold {
  font-weight: bold;
}

.text-warning {
  color: #cc241d;
}

.material {
  box-shadow: 0 2px 7px 0px rgba(#000, 0.4);
}

.icon-text {
}

.icon-text__icon {
  display: inline-block;
  svg {
    height: 16px;
    width: 16px;
    vertical-align: -3px;
    margin-right: 4px;
    fill: currentColor;
  }
}

.icon-text__text {
  display: inline-block;
  font-size: 14px;
}

.color0 {
  color: var(--color0);
}

.color1 {
  color: var(--color1);
}

.color2 {
  color: var(--color2);
}

.color3 {
  color: var(--color3);
}

.color4 {
  color: var(--color4);
}

.color5 {
  color: var(--color5);
}

.color6 {
  color: var(--color6);
}

.color7 {
  color: var(--color7);
}

.color8 {
  color: var(--color8);
}

.color9 {
  color: var(--color9);
}

.color10 {
  color: var(--color10);
}

.color11 {
  color: var(--color11);
}

.color12 {
  color: var(--color12);
}

.color13 {
  color: var(--color13);
}

.color14 {
  color: var(--color14);
}

.color15 {
  color: var(--color15);
}

.foreground {
  color: var(--foreground);
}

.background {
  color: var(--background);
}





</style>
