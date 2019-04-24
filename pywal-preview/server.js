const APP_NAME = 'basmati';

var express    = require('express');        // call express
var app        = express();                 // define our app using express
var bodyParser = require('body-parser');
var cors       = require('cors');

var glob       = require('glob');
var fs         = require('fs');
var path       = require('path');

var xdgBasedir = require('xdg-basedir');
var sharip     = require('sharp');
var ini        = require('ini');

var stateFile = path.join(xdgBasedir.config, APP_NAME, 'state.json');

function getFilesInDirectory (dirGlob) {
  return new Promise(function(resolve, reject) {
    glob(dirGlob, function(err, files) {
      if (err) {
        console.log('cannot read the folder, something goes wrong with glob', err);
      }

      resolve(files)
    });
  });
}

function getFileStats (file) {
  return new Promise(function(resolve, reject) {
    fs.stat(file, (err, stats) => {
      if (err) {
        reject(err);
      }
      resolve(stats.mtime)
    })
  })
}

function parseThemes (files) {
  return Promise.all(files.map(function(file) {
    return new Promise(function(resolve, reject) {
      fs.readFile(file, 'utf8', async (err, data) => {
        if (err) {
          console.log('cannot read the file, something goes wrong with the file', err);
        }

        const fileName = path.basename(file, '.json')
        const obj = JSON.parse(data);

        const colorscheme = {
          name: fileName,
          data: obj,
          modified: await getFileStats(file)
        }

        resolve(colorscheme)
      });
    });
  }));
}

function parsePolybar (files) {
  return Promise.all(files.map(function(file) {
    return new Promise(function(resolve, reject) {
      fs.readFile(file, 'utf8', async (err, data) => {
        if (err) {
          console.log('cannot read the file, something goes wrong with the file', err);
        }

        const fileName = path.basename(file, '.json')
        const obj = ini.parse(data)

        const config = {
          bar: [],
          module: [],
          global: [],
          variables:{},
          settings: {},
        }

        Object.keys(obj).forEach(key => {

          if (key.indexOf('/') !== -1) {
            const splittedKey = key.split('/')

            const type = splittedKey[0]
            const name = splittedKey[1]
            config[type].push({
              name: name,
              config: obj[key]
            })
          } else {
            if (key === 'settings') {
              config[key] = obj[key]
            } else {
              config.variables[key] = obj[key]
            }
          }
        })

        const polybar = {
          name: fileName,
          data: config,
          modified: await getFileStats(file)
        }

        resolve(polybar)
      });
    });
  }));
}

function parseColorschemes (files) {
  return Promise.all(files.map(function(file) {
    return new Promise(function(resolve, reject) {
      fs.readFile(file, 'utf8', async (err, data) => {
        if (err) {
          console.log('cannot read the file, something goes wrong with the file', err);
        }

        const fileName = path.basename(file, '.json')
        const obj = JSON.parse(data);

        const colorscheme = {
          name: fileName,
          data: obj,
          modified: await getFileStats(file)
        }

        resolve(colorscheme)
      });
    });
  }));
}

function getState () {
  return new Promise(function(resolve, reject) {
    console.log(stateFile)
    fs.readFile(stateFile, 'utf8', async (err, data) => {
      console.log(err)
      if (err) {
        console.log('cannot read the file, something goes wrong with the file', err);
      }

      const state = JSON.parse(data);
      resolve({
        state: state
      })
    });
  });
}

function getThemes () {
  return new Promise(async function(resolve, reject) {
    const files = await getFilesInDirectory('public/themes/*.json')
    const themes = await parseThemes(files)

    resolve({
      themes: themes,
      active: themes[0].name
    })
  });
}


function getPolybar () {
  return new Promise(async function(resolve, reject) {
    const files = await getFilesInDirectory('public/polybar/*.ini')
    const polybar = await parsePolybar(files)

    resolve({
      polybar: polybar
    })
  });
}

function getColorschemes () {
  return new Promise(async function(resolve, reject) {
    const files = await getFilesInDirectory('public/colorschemes/*.json')
    const colorschemes = await parseColorschemes(files)

    resolve(colorschemes)
  });
}

function getWallpapers () {
  return new Promise(async function(resolve, reject) {
    const files = await getFilesInDirectory('public/wallpapers/*')
    console.log(files)

    const wallpapers = files.map(file => {
      return path.basename(file)
    })

    resolve(wallpapers)
  });
}

function updateColorscheme (colorscheme) {
  const filePath = path.join(__dirname, 'public', 'colorschemes', colorscheme.name + '.json');
  const fileContent = JSON.stringify(colorscheme);

  return new Promise(function(resolve, reject) {
    fs.writeFile(filePath, fileContent, function(err) {
      if (err) {
        reject(err);
      }

      resolve(filePath);
    });
  });
}

function updateTheme (theme) {
  const fileContent = JSON.stringify(theme.data);

  return new Promise(function(resolve, reject) {
    const filePath = path.join(__dirname, 'public', 'themes', theme.name + '.json');

    fs.writeFile(filePath, fileContent, function(err) {
      if (err) {
        reject(err);
      }

      resolve(filePath);
    });
  });
}

function updateState (state) {
  const fileContent = JSON.stringify(state);

  return new Promise(function(resolve, reject) {
    fs.writeFile(stateFile, fileContent, function(err) {
      if (err) {
        reject(err);
      }

      resolve(stateFile);
    });
  });
}

function deleteColorscheme (colorscheme) {
  const filePath = path.join(__dirname, 'public', 'colorschemes', colorscheme.name + '.json');

  return new Promise(function(resolve, reject) {
    fs.unlink(filePath, function(err) {
      if (err) {
        reject(err);
      }

      resolve(filePath);
    });
  });
}

// configure app to use bodyParser()
// this will let us get the data from a POST
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());

var port = process.env.PORT || 8081;        // set our port

// test route to make sure everything is working (accessed at GET http://localhost:8080/api)
app.get('/themes', async function(req, res) {
  const themes = await getThemes();
  res.json(themes);
});

app.get('/colorschemes', async function(req, res) {
  const colorschemes = await getColorschemes();
  res.json(colorschemes);
});

app.get('/wallpapers', async function(req, res) {
  const wallpapers = await getWallpapers();
  res.json(wallpapers);
});

app.get('/state', async function(req, res) {
  const state = await getState();
  res.json(state);
});

app.get('/polybar', async function(req, res) {
  const polybar = await getPolybar();
  res.json(polybar);
});

app.post('/state/update', async function(req, res) {
  const state = req.body.state;
  const result = await updateState(state);

  res.end(result)
});

app.post('/colorscheme/update', async function(req, res) {
  const colorscheme = req.body.colorscheme;
  const result = await updateColorscheme(colorscheme);

  res.end(result)
});

app.post('/colorscheme/delete', async function(req, res) {
  const colorscheme = req.body.colorscheme;
  const result = await deleteColorscheme(colorscheme);

  res.end(result)
});

app.post('/theme/update', async function(req, res) {
  const theme = req.body.theme;
  const result = await updateTheme(theme);

  res.end(result)
});


// more routes for our API will happen here

// START THE SERVER
// =============================================================================
app.listen(port);
console.log('Magic happens on port ' + port);

