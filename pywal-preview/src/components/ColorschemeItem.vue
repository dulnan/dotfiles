<template>
  <div class="colorscheme-item">
    <button class="button colorscheme-item__preview material" @click="setActiveItem">
      <colorscheme-preview :colorscheme="colorscheme" />
    </button>

    <div class="colorscheme-item__info">
      <div class="text-bold colorscheme-name">
        {{ colorscheme.name }}
        <button class="button edit-name">
          <icon-edit />
        </button>
      </div>
      <div class="info--modified text-small text-muted">
        <icon-time />
        <span>23. July 2018 - 13:24</span>
      </div>
      <div class="actions">
        <ul class="list">
          <li>
            <button class="button text-small">
              <icon-copy /><span>Copy</span>
            </button>
          </li>
          <li>
            <button class="button text-small">
              <icon-delete /><span>Delete</span>
            </button>
          </li>
        </ul>
      </div>
      <!--<ul class="list colorscheme-colors">
        <li v-for="color in colors" :key="color.name" :style="{ backgroundColor: color.hex }"></li>
      </ul>
      -->
    </div>
  </div>
</template>

<script>
import { parseColorscheme } from '@/tools/helpers'

import ColorschemePreview from '@/components/ColorschemePreview.vue'

import IconTime from '@/assets/icon-time.svg'
import IconCopy from '@/assets/icon-copy.svg'
import IconDelete from '@/assets/icon-delete.svg'
import IconEdit from '@/assets/icon-edit.svg'

export default {
  name: 'ColorschemeItem',

  components: {
    ColorschemePreview,
    IconTime,
    IconCopy,
    IconDelete,
    IconEdit
  },

  props: {
    colorscheme: Object
  },

  computed: {
    colors () {
      return parseColorscheme(this.colorscheme.data).splice(0,18)
    }
  },

  methods: {
    setActiveItem () {
      this.$store.dispatch('setActiveColorscheme', this.colorscheme.name)
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.colorscheme-item {
  padding: 1rem;
  display: flex;
  &:hover {
    .edit-name, .actions {
      opacity: 1;
    }
  }
}

.colorscheme-item__info {
  flex: 1;
  padding-left: 0.75rem;
  display: flex;
  flex-direction: column;
  svg {
    height: 1rem;
    width: 1rem;
    fill: currentColor;
    vertical-align: -3px;
    margin-right: 3px;
  }
  .info--modified {
    margin-top: 0.25rem;
  }
}

.colorscheme-item__modified {
  margin-top: 0.25rem;
}

.colorscheme-name {
  // font-size: 1.25rem;
}

.edit-name {
  vertical-align: 0px;
  width: 14px;
  height: 14px;
  opacity: 0;
}

.colorscheme-colors {
  display: flex;
  flex-wrap: wrap;
  margin-top: 1rem;
  li {
    display: block;
    width: 14px;
    height: 14px;
    border-radius: 100%;
    margin-right: 4px;
    margin-bottom: 4px;
  }
}


.actions {
  opacity: 0;
  margin-top: auto;
  .list {
    display: flex;
    li {
      margin-right: 0.5rem;
      svg {
        width: 14px;
        height: 14px;
      }
    }
  }
}
</style>
