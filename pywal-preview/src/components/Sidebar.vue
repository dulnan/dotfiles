<template>
    <aside class="sidebar" :style="sidebarStyle">
      <div class="sidebar-main">
        <div class="sidebar-toolbar">

          <ul class="list toolbar">
            <li v-for="item in toolbarItems" :key="'toolbar_' + item.name">
              <button
                class="button toolbar__button"
                @click="activeItem = item.name"
                :class="{'is-active': item.name === activeItem }"
              >
                <component :is="item.icon" />
                <span>{{ item.name }}</span>
              </button>
            </li>
          </ul>
        </div>
        <div class="sidebar-content">
          <template v-for="item in toolbarItems">
            <component
              v-show="item.name === activeItem"
              :is="item.view"
              :key="item.name"
            />
          </template>
        </div>
      </div>
    </aside>
</template>

<script>
import { mapState, mapGetters } from 'vuex'

import IconColors from '@/assets/icon-colors.svg'
import IconPalette from '@/assets/icon-palette.svg'
import IconWallpaper from '@/assets/icon-wallpaper.svg'
import IconSettings from '@/assets/icon-settings.svg'

import Colors from '@/components/Colors.vue'
import Settings from '@/components/Settings.vue'
import Background from '@/components/Background.vue'

export default {
  name: 'Sidebar',

  components: {
    IconColors,
    IconPalette,
    IconWallpaper,
    IconSettings,
    Colors,
    Settings,
    Background,
  },

  props: {
    sidebarWidth: {
      type: Number,
      default: 300
    }
  },

  data () {
    return {
      activeItem: 'colors',
      toolbarItems: [
        {
          name: 'colors',
          icon: 'IconPalette',
          view: 'Colors'
        },
        {
          name: 'wallpaper',
          icon: 'IconWallpaper',
          view: 'Background'
        },
        {
          name: 'settings',
          icon: 'IconSettings',
          view: 'Settings'
        }
      ]
    }
  },

  computed: {
    ...mapState([
    ]),
    ...mapGetters({
      activeTheme: 'getActiveTheme',
      themeHasChanged: 'themeHasChanged'
    }),
    sidebarStyle () {
      return {
        width: this.sidebarWidth + 'px'
      }
    }
  },

  watch: {
  },

  methods: {
    toggleThemeList () {
      this.$store.commit('updateThemeListVisible', !this.themeListVisible)
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
.sidebar {
  background: var(--background);
  color: var(--foreground);
}

.sidebar-main {
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.sidebar-toolbar {
  flex: 0 0 auto;
  position: relative;
  z-index: 10;
}


.sidebar-content {
  overflow: auto;
  flex: 1;
}

.toolbar {
  display: flex;
  justify-content: space-between;
  box-shadow: 0 1px 6px rgba(#999, 0.5);
}

.toolbar__button {
  padding: 0.5rem 1rem;
  border-bottom: 2px solid white;
  cursor: pointer;
  color: #ccc;
  font-size: 0.75rem;
  &.is-active {
    border-color: black;
    color: #444;
  }
  svg {
    width: 1rem;
    height: 1rem;
    fill: currentColor;
    float: left;
  }
}
</style>
