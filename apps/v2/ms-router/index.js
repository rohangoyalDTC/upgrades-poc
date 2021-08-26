const express = require('express')

const app = express()
const appPort = 3000

app.use('/streaming', (req, resp) => {
  var message = "Hello from MS Router Green";
  console.log(message);
  var request = require('sync-request');
  console.log('Host:' + process.env.CLUSTER_URL)
  var res = request('GET', process.env.CLUSTER_URL + "/process");
  result = res.getBody('utf-8');
  resp.send(result);
})

app.listen(appPort, () => {
  console.log('Application Started on Port 3000')
})