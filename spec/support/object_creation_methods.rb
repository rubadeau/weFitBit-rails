def create_user(options= {})
  User.create!({
  user_name: 'Testy',
  email: 'testyMcTesterson@example.com',
  password: 'password',
  admin: false
  }.merge(options))
end

def create_admin_user(options= {})
  User.create!({
  user_name: 'Testy',
  email: 'testyMcTesterson@example.com',
  password: 'password',
  admin: false
  }.merge(options))
end
