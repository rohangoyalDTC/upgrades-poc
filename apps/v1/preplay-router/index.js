const express = require('express')

const app = express()
const appPort = 3000

app.use('/preplay', (req, resp) => {
  var message = "Hello from Preplay Blue";
  console.log(message);
  var request = require('sync-request');
  console.log('Host:' + process.env.CLUSTER_URL)
  var res = request('GET', process.env.CLUSTER_URL + "/give-url");
  result = res.getBody('utf-8');
  arr=result.split('/')
  arr.splice(2, 0, process.env.DEP_TYPE)
  resp.send(arr.join('/'));
})

app.listen(appPort, () => {
  console.log('Application Started on Port 3000')
})