<template>
  <div class="color">
    <button class="button color__button" :class="colorClasses">
      <div class="color__number">{{ color.name }}</div>
      <div class="color__hex">{{ color.hex }}</div>
    </button>
    <input class="color__input" type="color" :value="color.hex" @input="handleColorChange" />
  </div>
</template>

<script>
const checkContrast = require('contrast')

export default {
  name: 'Color',
  props: {
    color: Object,
  },

  computed: {
    colorClasses () {
      const contrast = checkContrast(this.color.hex)
      return [
        `color--${contrast}`,
        this.color.name
      ]
    }
  },

  methods: {
    handleColorChange (e) {
      this.$store.commit('updateColor', {
        color: this.color,
        hex: e.target.value
      })
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.color {
  position: relative;
  font-family: $font-monospace;
  height: 100%;
  &:hover {
    .color__number, .color__hex {
      opacity: 1;
    }
  }
}
.color__button {
  display: flex;
  align-items: center;
  font-size: 13px;

  padding: 0.5rem;
  cursor: pointer;
  width: 100%;
  height: 100%;
  background: currentColor;
}

.color__input {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  z-index: 1;
  cursor: pointer;
}

.color__number,
.color__hex {
  color: white;
  .color--light & {
    color: black;
  }
}

.color__number {
  font-weight: bold;
  opacity: 0.5;
}

.color__hex {
  margin-left: auto;
  opacity: 0.3;
}
</style>
