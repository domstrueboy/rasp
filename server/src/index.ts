const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const { MongoClient } = require('mongodb');
const assert = require('assert');

const port = 3000;

const dbUrl = 'mongodb://localhost:27017';
const dbName = 'rasp';

const app = express();
app.use(bodyParser.json());
app.use(cors());

MongoClient.connect(dbUrl, (err, client) => {
  assert.equal(null, err);
  // eslint-disable-next-line no-console
  console.log('Connected successfully to server');

  const db = client.db(dbName);

  app.get('/', (req, res) => {
    res.send('<h1>Hello World!</h1>');
  });

  app.post('/add-event', (req, res) => {
    const event = { ...req.body };
    db.collection('events').insertOne(event, (err, result) => {
      if (err) {
        res.send({ error: 'An error has occurred' });
      } else {
        res.send(result.ops[0]);
      }
    });
  });

  app.listen(port, () => {
    // eslint-disable-next-line no-console
    console.log(`We are live on ${port}`);
  });

  // client.close();
});
