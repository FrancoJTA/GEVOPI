db = db.getSiblingDB('GEVOPI');
db.createUser({
  user: 'gevopi',
  pwd: 'gevopi123',
  roles: [
    { role: 'readWrite', db: 'GEVOPI' },
  ],
});