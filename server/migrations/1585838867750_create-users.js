/* eslint-disable camelcase */

exports.shorthands = undefined;

exports.up = pgm => {
  pgm.createTable('users', {
    id: 'id',
    email: { type: 'varchar', notNull: true, unique: true },
    password: { type: 'varchar', notNull: true }
  })
};

exports.down = pgm => {
  pgm.dropTable('users')
};
