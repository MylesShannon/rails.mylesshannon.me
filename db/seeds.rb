# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([
  { provider: 'google', uid: '123', first_name: 'Myles', last_name: 'Shannon', display_name: 'Myles', email: 'myles@mylesshannon.me', token: '123' },
  { provider: 'google', uid: '1234', first_name: 'Mike', last_name: 'Shem', display_name: 'Myles', email: 'mshem@mylesshannon.me', token: '1234' }
])

Note.create([
  { user: users.first, title: 'Hello World', body: 'Check out this body!'},
  { user: users.last, title: 'Another Test Note', body: 'What to write?'}
])