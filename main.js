const {app, BrowserWindow} = require('electron');

let mainWindow;

app.on('ready', () => {
  mainWindow = new BrowserWindow({
      height: 700,
      width: 950,
      frame: false
  });

  mainWindow.loadURL('file://' + __dirname + '/index.html');
});
