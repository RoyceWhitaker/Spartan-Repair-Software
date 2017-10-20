const {app, BrowserWindow} = require('electron');

let mainWindow;

app.on('ready', () => {
  mainWindow = new BrowserWindow({
      height: 800,
      width: 800,
      frame: false
  });

  mainWindow.loadURL('file://' + __dirname + '/index.html');
});
