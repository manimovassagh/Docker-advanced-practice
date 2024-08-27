const express = require('express');
const cors = require('cors'); // Import the CORS middleware

const app = express();

app.use(cors()); // Enable CORS for all routes

app.get('/', (req, res) => {
  res.send([
    {
      name: "I can learn anything ",
      age: 44
    },
    {
      name: "Changed Sahar 2222",
      age: 38
    }
  ]);
});

app.listen(8000, () => {
  console.log('Server is running on http://localhost:8000');
});
