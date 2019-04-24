<template>
  <div class="colorscheme-preview" :style="getWindowStyle()" v-if="colorscheme">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 72 112" width="72" height="112">
      <rect x="0" y="0" width="72" height="112" :style="getStyle('special', 'background')" />

      <rect x="6" y="6" width="16" height="2" :style="getStyle('colors', 'color1')" />
      <rect x="10" y="10" width="22" height="2" :style="getStyle('colors', 'color2')" />
      <rect x="14" y="14" width="36" height="2" :style="getStyle('colors', 'color3')" />
      <rect x="10" y="18" width="22" height="2" :style="getStyle('colors', 'color2')" />
      <rect x="6" y="22" width="16" height="2" :style="getStyle('colors', 'color1')" />

      <rect x="6" y="30" width="12" height="2" :style="getStyle('special', 'foreground')" />
      <rect x="6" y="34" width="30" height="2" :style="getStyle('colors', 'color6')" />

      <rect x="6" y="42" width="16" height="2" :style="getStyle('colors', 'color5')" />
      <rect x="10" y="46" width="16" height="2" :style="getStyle('colors', 'color2')" />

      <rect x="10" y="50" width="44" height="2" :style="getStyle('colors', 'color7')" />
      <rect x="10" y="54" width="38" height="2" :style="getStyle('colors', 'color7')" />

      <rect x="10" y="62" width="30" height="2" :style="getStyle('colors', 'color8')" />
      <rect x="10" y="66" width="36" height="2" :style="getStyle('colors', 'color8')" />

      <rect x="6" y="74" width="6" height="2" :style="getStyle('colors', 'color1')" />

      <rect x="6" y="78" width="12" height="2" :style="getStyle('colors', 'color9')" />
      <rect x="6" y="82" width="24" height="2" :style="getStyle('colors', 'color10')" />
      <rect x="6" y="86" width="20" height="2" :style="getStyle('colors', 'color11')" />
      <rect x="6" y="90" width="32" height="2" :style="getStyle('colors', 'color12')" />

      <rect x="6" y="98" width="20" height="2" :style="getStyle('colors', 'color13')" />
      <rect x="6" y="102" width="32" height="2" :style="getStyle('colors', 'color14')" />
      <rect x="6" y="106" width="16" height="2" :style="getStyle('colors', 'color15')" />

    </svg>
  </div>
</template>

<script>
export default {
  name: 'ColorschemePreview',

  props: {
    colorscheme: Object,
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
    }
  },
}
</script>

<style scoped lang="scss">
</style>
