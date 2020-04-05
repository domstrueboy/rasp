const express = require('express');
const cors = require('cors');

const app = express();

app.use(cors());

app.get('/', (req, res) => {
  res.send('<h1>Hello World!</h1>');
});

app.post('/add-event', (req, res) => {
  res.json({
    ping: 'pong',
  });
});

app.listen(3000);
