const express = require('express')

const app = express()
const appPort = 3000

app.use('/give-url', (req, resp) => {
  var message = "Hello from MS Cluster Green: /give-url";
  console.log(message);
  resp.send('/ms-router/streaming'); // Note that this route has changed
})

app.use('/process', (req, resp) => {
  var message = "Hello from MS Cluster Green: /process";
  console.log(message);
  resp.send(message);
})

app.listen(appPort, () => {
  console.log('Application Started on Port 3000')
})