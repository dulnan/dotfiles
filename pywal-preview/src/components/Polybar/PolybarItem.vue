<template>
  <li class="polybar-item">
    <div class="polybar-item__prefix" :class="item.prefixColor">{{ item.prefix }}</div>
    <div class="polybar-item__text foreground" v-if="item.text">{{ item.text }}</div>
  </li>
</template>

<script>
export default {
  name: 'PolybarItem',

  props: {
    item: {
      type: Object,
      default: () => {
        return {
          prefix: '',
          prefixColor: 'foreground',
          text: ''
        }
      }
    }
  },

  methods: {
  }
}
</script>

<style lang="scss">
.polybar-item {
  display: flex;
  font-family: "Iosevka Nerd Font";
  padding: 0 8px;
}

.polybar-item__prefix {
  font-size: 15px;
  margin-top: -1px;
}

.polybar-item__text {
  font-size: 13px;
  margin-left: 8px;
}

</style>
