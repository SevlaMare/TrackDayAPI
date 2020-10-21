# script to populate the database

# run on terminal before start the app, with:
# rake db:setup

# if already have db created:
# rake db:seed

# Setup
['travelled distance', 'time lap', 'braking distance', 'lean angle'].each do |item|
  Measure.create(name: item)
end

# Mock
User.create(name: 'test', email: 'test@email.com', password: 'test123')
