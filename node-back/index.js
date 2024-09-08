const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send({
    "name":"Mani"
  })
  console.log("The home route hit!!!")
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})