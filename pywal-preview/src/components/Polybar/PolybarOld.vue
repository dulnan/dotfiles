<template>
  <div class="polybar-container background">
    <div class="polybar">
      <div
        v-for="area in areas"
        class="polybar__area"
        :key="area.position"
        :class="'polybar__area--' + area.position"
      >
        <ul class="polybar-list">
          <polybar-item
            v-for="(item, index) in area.items"
            :key="index"
            :item="item"
          />
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import PolybarItem from './PolybarItem.vue'

export default {
  name: 'Polybar',

  components: {
    PolybarItem
  },

  props: {
    colorscheme: Object
  },

  data () {
    return {
      areas: [
        {
          position: 'left',
          items: [
            {
              prefix: '',
              prefixColor: 'foreground',
              text: ''
            },
            {
              prefix: '',
              prefixColor: 'foreground',
              text: ''
            },
            {
              prefix: '',
              prefixColor: 'foreground',
              text: ''
            },
            {
              prefix: '',
              prefixColor: 'foreground',
              text: ''
            },
          ],
        },
        {
          position: 'right',
          items: [
            {
              prefix: '婢',
              prefixColor: 'color1',
              text: 'muted'
            },
            {
              prefix: 'ﳀ',
              prefixColor: 'color4',
              text: '1375.34 MB'
            },
            {
              prefix: '勞',
              prefixColor: 'color3',
              text: '14%'
            },
            {
              prefix: '直',
              prefixColor: 'color9',
              text: 'Bobby Tables'
            },
            {
              prefix: 'ﰒ',
              prefixColor: 'color2',
              text: 'Swisscom'
            },
            {
              prefix: '',
              prefixColor: 'color5',
              text: '64%'
            },
            {
              prefix: '﨎',
              prefixColor: 'color7',
              text: '38°C'
            },
            {
              prefix: '',
              prefixColor: 'color6',
              text: '21:57'
            },
          ]
        }
      ]
    }
  },

  methods: {
  }
}
</script>

<style lang="scss">
.polybar-container {
  background: currentColor;
}

.polybar-list {
  list-style-type: none;
  margin: 0;
  padding: 0;
  display: flex;
}

.polybar {
  padding: 1rem;
  display: flex;
}

.polybar__area--right {
  margin-left: auto;
}


</style>
