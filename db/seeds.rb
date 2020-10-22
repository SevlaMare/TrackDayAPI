# script to populate the database

# run on terminal before start the app, with:
# rake db:setup

# if already have db created:
# rake db:seed

# Setup
['travelled distance', 'time lap', 'braking distance', 'lean angle'].each do |item|
  Measure.create(name: item)
end

# Mock user - ps field send as password and store as password_digest due bcrypt
User.create(username: 'test', email: 'test@email.com', password: 'test123')

# Mock measurements
# User.first.measurements.create(value: 123, measure_id: 1)