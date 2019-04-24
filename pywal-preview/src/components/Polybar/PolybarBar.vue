<template>
  <div class="polybar-bar">
    <div
      v-for="location in locations"
      class="polybar-bar__location"
      :class="'polybar-bar__location--' + location"
      :key="location"
    >
      <polybar-module
        v-for="moduleName in modules[location]"
        :module="getModule(moduleName)"
        :key="moduleName"
      />
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import PolybarModule from './PolybarModule.vue'

export default {
  name: 'PolybarBar',

  components: {
    PolybarModule
  },

  props: {
    bar: Object
  },

  data () {
    return {
      locations: ['left', 'center', 'right']
    }
  },

  computed: {
    ...mapGetters(['getActivePolybarModules']),

    modules () {
      const barModules = {
        left: [],
        center: [],
        right: []
      }

      this.locations.forEach(location => {
        let definition = this.bar.config['modules-' + location]

        if (definition) {
          const modules = definition.trim().replace(/ +(?= )/g,'').split(' ')

          barModules[location] = modules
        }
      })

      return barModules
    }
  },

  methods: {
    getModule (moduleName) {
      return this.getActivePolybarModules[moduleName]
    }
  }
}
</script>

<style lang="scss">
.polybar-bar {
  background: red;
  height: 40px;
  z-index: 9999;
  position: relative;
  display: flex;
}

.polybar-bar__location {
  display: flex;
}

.polybar-bar__location--left {
  align-items: flex-start;
}

.polybar-bar__location--center {
  align-items: center;
  flex: 1;
}

.polybar-bar__location--right {
  align-items: flex-end;
}
</style>
