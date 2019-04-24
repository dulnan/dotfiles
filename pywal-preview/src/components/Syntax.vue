<template>
  <div class="syntax" :class="{ 'is-offset': themeListVisible }">
    <div class="code">
      <pre v-highlightjs="sourcecode"><code class="vue"></code></pre>
    </div>
  </div>
</template>

<script>
/* eslint-disable */
import { mapState } from 'vuex'

export default {
  name: 'Syntax',
  props: {
    colorscheme: Object
  },

  data () {
    return {
      sourcecode: ''
    }
  },

  computed: {
    ...mapState([
      'themeListVisible'
    ])
  },

  methods: {
    getColorByNumber (number) {
      return this.colorscheme.colors['color' + number]
    },
  },

  mounted () {
    this.sourcecode = `
<template>
  <div class="colors__item">
    <div class="color" :style="style">
      <div class="color__hex">{{ color }}</div>
    </div>
  </div>
</template>

<script>
const checkContrast = require('contrast')
import App from './App.vue'

export default {
  name: 'Color',
  props: {
    color: String,
    index: Number
  },

  computed: {
    style: function () {
      const contrast = checkContrast(this.color)
      return {
        backgroundColor: this.color,
        color: contrast === 'light'
      }
    }
  }
}
<\/script>

<!-- These are fancy styles -->
<style scoped lang="scss">
.colors__item {
  width: 100%;
  padding-top: 100%;
  position: relative;
}
</style>
`
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss">
pre {
  margin: 0;
}

.syntax {
  min-height: 100%;
  background: var(--background);
  &.is-offset {
    transform: translateX(300px);
  }
}

.hljs {
  display: block;
  overflow-x: auto;
  padding: 1rem;
  font-family: $font-monospace;
  font-size: 15px;
}

.hljs-built_in,
.hljs-selector-tag,
.hljs-section,
.hljs-link {
  color: var(--foreground);
}

.hljs-built_in {
  color: var(--color3);
}

.hljs-keyword {
  color: var(--color5);
  .hljs-function & {
    color: var(--color1);
  }
}

.hljs,
.hljs-subst {
  color: #f8f8f2;
}

.hljs-title {
  color: #50fa7b;
}

.hljs-attr {
  color: var(--color3);
  .javascript & {
    color: var(--foreground);
  }
}

.hljs-attribute {
  color: var(--color3);
}

.hljs-string {
  color: var(--color2);
}


.hljs-template-variable {
  color: var(--foreground);
}

.hljs-meta,
.hljs-name,
.hljs-type,
.hljs-symbol,
.hljs-bullet,
.hljs-addition,
.hljs-variable,
.hljs-template-tag {
  color: var(--color1);
}

.hljs-comment,
.hljs-quote,
.hljs-deletion {
  color: var(--color8);
}

.hljs-keyword,
.hljs-selector-tag,
.hljs-literal,
.hljs-title,
.hljs-section,
.hljs-doctag,
.hljs-type,
.hljs-name,
.hljs-strong {
  font-weight: bold;
}

.hljs-literal,
.hljs-number {
  color: #bd93f9;
}

.hljs-emphasis {
  font-style: italic;
}
</style>
