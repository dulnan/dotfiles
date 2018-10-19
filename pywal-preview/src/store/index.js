/* eslint-disable */
import { parseColorscheme } from '@/tools/helpers'

import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

let timeout = null

export default new Vuex.Store({
	state: {
    isSaving: false,

    themes: [],
    themesLoaded: false,
    activeTheme: '',

    colorschemes: [],
    colorschemesLoaded: false,
    activeColorscheme: '',
    activeColors: [],

    wallpapers: [],
    wallpapersLoaded: false,
    activeWallpaper: '',

    polybars: [],
    activePolybar: '',

    themeListVisible: false
	},

	mutations: {
	  updateActiveColorscheme (state, colorschemeName) {
	    state.activeColorscheme = colorschemeName
	  },

    updateActiveColors (state, colors) {
	    state.activeColors = colors
	  },

    updateActiveWallpaper (state, wallpaperName) {
	    state.activeWallpaper = wallpaperName
	  },

	  updateActiveTheme (state, themeName) {
	    state.activeTheme = themeName
	  },

    updateActivePolybar (state, polybarName) {
	    state.activePolybar = polybarName
	  },

    updateColor (state, { color, hex }) {
      const newColor = color
      newColor.hex = hex

      Vue.set(state.activeColors, color.index, newColor)
    },

    updateColorschemes (state, colorschemes) {
      state.colorschemes = colorschemes
      state.colorschemesLoaded = true
    },

    updateWallpapers (state, wallpapers) {
      state.wallpapers = wallpapers
      state.wallpapersLoaded = true
    },

    updateThemes (state, themes) {
      state.themes = themes
      state.themesLoaded = true
    },

    updatePolybars (state, polybars) {
      state.polybars = polybars
    },

    updateThemeListVisible (state, isVisible) {
      state.themeListVisible = isVisible
    },

    updateIsSaving (state, isSaving) {
      state.isSaving = isSaving
    },
	},

	actions: {
    saveTheme ({ commit, dispatch, state }) {
      const theme = {
        name: state.activeTheme,
        data: {
          colorscheme: state.activeColorscheme,
          wallpaper: state.activeWallpaper
        }
      }

      Vue.axios.post('/theme/update', {
        theme: theme
      }).then(function(response) {
        dispatch('fetchThemes', {})
      })
	  },

    saveState ({ commit, dispatch, state }) {
      window.clearTimeout(timeout)

      timeout = window.setTimeout(() => {
        const newState = {
          activeTheme: state.activeTheme,
          activeColorscheme: state.activeColorscheme,
          activeColors: state.activeColors,
          activeWallpaper: state.activeWallpaper
        }

        Vue.axios.post('/state/update', {
          state: newState
        }).then(function(response) {
          console.log('State saved.')
        })
      }, 5000)
	  },

    fetchState ({ commit, dispatch, state }) {
	    Vue.axios.get('/state').then(function(response) {
	      const newState = response.data.state

	      if (newState.activeColors) commit('updateActiveColors', newState.activeColors)
	      if (newState.activeWallpaper) commit('updateActiveWallpaper', newState.activeWallpaper)
	      if (newState.activeColorscheme) commit('updateActiveColorscheme', newState.activeColorscheme)
	      if (newState.activeTheme) commit('updateActiveTheme', newState.activeTheme)
	    })
	  },

    fetchThemes ({ commit, dispatch }, { isInitial }) {
	    Vue.axios.get('/themes').then(function(response) {
	      commit('updateThemes', response.data.themes)
	    })
	  },

	  fetchColorschemes ({ commit }, { isInitial }) {
	    Vue.axios.get('/colorschemes').then(function(response) {
	      commit('updateColorschemes', response.data)
	    })
	  },

    fetchWallpapers ({ commit }, { isInitial }) {
	    Vue.axios.get('/wallpapers').then(function(response) {
	      commit('updateWallpapers', response.data)
	    })
	  },

    fetchPolybars ({ commit }, { isInitial }) {
	    Vue.axios.get('/polybar').then(function(response) {
	      commit('updatePolybars', response.data.polybar)
	    })
	  },

    setActiveTheme ({ state, commit }, themeName) {
      commit('updateActiveTheme', themeName)
    },

    setActiveWallpaper ({ state, commit }, wallpaperName) {
      commit('updateActiveWallpaper', wallpaperName)
    },

    setActiveColorscheme ({ state, commit }, colorschemeName) {
      commit('updateActiveColorscheme', colorschemeName)

      const colorscheme = state.colorschemes.filter(c => c.name === colorschemeName)

      if (colorscheme[0]) {
        const colors = parseColorscheme(colorscheme[0].data)
        commit('updateActiveColors', colors)
      }
    },
	},

  getters: {
    getActiveTheme: state => {
	    const theme = state.themes.filter(theme => theme.name === state.activeTheme)

	    if (!theme) {
	      return null
	    }

	    return theme[0]
    },

    getActivePolybar: state => {
      const polybar = state.polybars[0]
      if (!polybar) {
        return null
      }

      return polybar
    },

    getActivePolybarModules: state => {
      const polybar = state.polybars[0]
      if (!polybar) {
        return {}
      }

      const allModules = {}
      polybar.data.module.forEach(module => {
        allModules[module.name] = module
      })

      return allModules
    },

    themeHasChanged: (state, getters) => {
      const activeTheme = getters.getActiveTheme
      if (!activeTheme) {
        return false
      }
      return activeTheme.data.wallpaper !== state.activeWallpaper || activeTheme.data.colorscheme !== state.activeColorscheme
    },

    contentHasLoaded: (state) => {
      return state.themesLoaded && state.colorschemesLoaded && state.wallpapersLoaded
    }
  }
})
