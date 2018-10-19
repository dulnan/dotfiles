export function parseColorscheme (colorscheme) {
  const props = ['colors', 'special']
  let colors = []

  props.forEach(prop => {
    Object.keys(colorscheme[prop]).forEach(color => {
      colors.push({
        name: color,
        hex: colorscheme[prop][color],
        type: prop,
        index: 0
      })
    })
  })

  colors.forEach((color, index) => {
    colors[index].index = index
  })

  return colors
}
