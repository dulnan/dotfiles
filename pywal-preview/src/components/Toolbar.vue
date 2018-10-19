<template>
    <aside class="toolbar-container background">
      <ul class="list toolbar foreground">
        <li>
          <button class="button toolbar-button" @click="toggleDropdown('themes')">
            <div class="toolbar-button__icon">
              <icon-theme />
            </div>
            <div>
              <div class="text-small text-label">Theme</div>
              <div class="text-bold" v-if="activeTheme">
                <span>{{ activeTheme.name }}</span>
                <span v-if="themeHasChanged" class="text-bold text-warning">*</span>
              </div>
            </div>
          </button>
          <div class="toolbar-dropdown" v-show="visibleDropdown === 'themes'">
            <themes />
          </div>
        </li>

        <li>
          <button class="button toolbar-button" @click="toggleDropdown('colorschemes')">
            <div class="toolbar-button__icon">
              <icon-palette />
            </div>
            <div>
              <div class="text-small text-label">Colorscheme</div>
              <div class="text-bold" v-if="activeTheme">
                <span>{{ activeColorscheme }}</span>
                <span v-if="themeHasChanged" class="text-bold text-warning">*</span>
              </div>
            </div>
          </button>
          <div class="toolbar-dropdown" v-show="visibleDropdown === 'colorschemes'">
            <colorschemes />
          </div>
        </li>

        <li>
          <button class="button toolbar-button" @click="toggleDropdown('wallpapers')">
            <div class="toolbar-button__icon">
              <icon-wallpaper />
            </div>
            <div>
              <div class="text-small text-label">Wallpaper</div>
              <div class="text-bold" v-if="activeTheme">
                <span>{{ activeWallpaper }}</span>
                <span v-if="themeHasChanged" class="text-bold text-warning">*</span>
              </div>
            </div>
          </button>
          <div class="toolbar-dropdown" v-show="visibleDropdown === 'wallpapers'">
            <background />
          </div>

        </li>

        <li>
          <div class="toolbar-actions">
            <button class="button toolbar-action-button foreground" :disabled="!themeHasChanged" @click="saveTheme">
              <div class="background">Save changes</div>
            </button>
          </div>
        </li>

      </ul>
    </aside>
</template>

<script>
import { mapState, mapGetters } from 'vuex'

import IconColors from '@/assets/icon-colors.svg'
import IconPalette from '@/assets/icon-palette.svg'
import IconWallpaper from '@/assets/icon-wallpaper.svg'
import IconTheme from '@/assets/icon-theme.svg'

import Themes from '@/components/Themes.vue'
import Background from '@/components/Background.vue'
import Colorschemes from '@/components/Colorschemes.vue'

export default {
  name: 'Toolbar',

  components: {
    IconColors,
    IconPalette,
    IconWallpaper,
    IconTheme,
    Themes,
    Background,
    Colorschemes
  },

  data () {
    return {
      visibleDropdown: ''
    }
  },

  props: {
  },

  computed: {
    ...mapState([
      'themeListVisible',
      'activeColorscheme',
      'activeWallpaper'
    ]),
    ...mapGetters({
      activeTheme: 'getActiveTheme',
      themeHasChanged: 'themeHasChanged'
    }),
  },

  watch: {
  },

  methods: {
    toggleDropdown (dropdownName) {
      if (this.visibleDropdown === dropdownName) {
        this.visibleDropdown = ''
      } else {
        this.visibleDropdown = dropdownName
      }
    },
    saveTheme () {
      this.$store.dispatch('saveTheme')
    }
  },

  mounted () {
  }
}
</script>

<style scoped lang="scss">
.toolbar-container {
  background: currentColor;
}

.toolbar-dropdown {
  position: absolute;
  z-index: 10;
  top: 100%;
  left: 1rem;
  width: 300px;
  background: white;
  margin-top: 1rem;
  max-height: calc(100vh - 9rem);
  box-shadow: 0 3px 7px rgba(black, 0.2);
  overflow: auto;
  color: $color-black;
}

.toolbar {
  display: flex;
  > li {
    position: relative;
    &:after {
      content: "";
      position: absolute;
      top: 0;
      right: 0;
      width: 1px;
      height: 100%;
      background: currentColor;
      opacity: 0.3;
    }
  }
}

.toolbar-button {
  min-width: 12rem;
  padding: 1rem;
  display: flex;
  position: relative;
  .text-label {
    color: currentColor;
    opacity: 0.7;
  }
  > div {
    position: relative;
    z-index: 2;
  }
  &:before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: currentColor;
    opacity: 0;
    z-index: 0;
  }
  &:hover:before {
    opacity: 0.15;
  }
}

.toolbar-button__icon {
  width: 2rem;
  height: 2rem;
  margin-right: 1rem;
  svg {
    fill: currentColor;
  }
}

.toolbar-actions {
  display: flex;
  align-items: center;
  padding: 0 1rem;
  height: 100%;
}

.toolbar-action-button {
  padding: 0 1rem;
  height: 2rem;
  background: currentColor;
  font-weight: bold;
  border-radius: 10rem;
  opacity: 0.8;
  &:hover {
    opacity: 1;
  }
  &:disabled {
    opacity: 0.1;
  }
}
</style>
