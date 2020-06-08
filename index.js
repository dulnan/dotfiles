const YAML = require("yaml");
const fs = require("fs");
const path = require("path");

const configs = {
  normal: [11.5, 10],
  oled: [19.5, 10],
  benq: [11.5, 5],
  dell: [10, 10],
};

function alterConfig(config, fontSize, padding = 10) {
  const altered = { ...config };
  altered.font.size = fontSize;
  altered.window.padding.x = padding;
  altered.window.padding.y = padding;

  return altered;
}

function buildAlacritty() {
  const dir = path.join(__dirname, "templates/alacritty");
  const base = YAML.parse(fs.readFileSync(path.join(dir, "base.yml"), "utf8"));

  const destDir = path.join(__dirname, "alacritty");

  Object.keys(configs).forEach((file) => {
    const config = configs[file];

    const altered = alterConfig(base, config[0], config[1]);

    fs.writeFileSync(
      path.join(destDir, file + ".yml"),
      YAML.stringify(altered)
    );
  });
}

buildAlacritty();
