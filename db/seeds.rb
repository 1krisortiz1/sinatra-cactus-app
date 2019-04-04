# will create seed data to work with and test association

# create 2 users

kristin = User.create(name: "Kristin", email: "kristin@kristin.com", password: "password")
grant = User.create(name: "Grant", email: "grant@grant.com", password: "password")

# Create some cactus entries 

CactusEntry.create(image: "https://cdn11.bigcommerce.com/s-oqm1pc/images/stencil/631x631/products/2606/5523/golden_ball_cactus__69115.1522882144.jpg?c=2", content: "Kristin's picture of a cactus will be here", user_id: kristin.id)

# Use AR to pre-associate data: 

kristin.cactus_entries.create(content: "We are building a Sinatra Cactus App! Go Cacti!")

grants_entry = grant.cactus_entries.build(content: "Prickly Pear Cactus", location: "Yuma, AZ", color_flowers: "Prickly Pear fruit present!", water_conservation_method: "Paddle stems")
grants_entry.save 