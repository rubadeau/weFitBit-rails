def create_user(options= {})
  User.create!({
  user_name: 'Testy',
  email: 'testyMcTesterson@example.com',
  password: 'password',
  admin: true
  }.merge(options))
end
