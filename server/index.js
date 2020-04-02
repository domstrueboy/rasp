const { Server } = require('@logux/server')
const pg = require('pg-promise')

const server = new Server(
  Server.loadOptions(process, {
    subprotocol: '1.0.0',
    supports: '1.x',
    root: __dirname
  })
)

let db = pg()(process.env.DATABASE_URL)

server.auth((userId, token) => {
  // Allow users until we will have a proper authentication
  return true;
})

server.listen()