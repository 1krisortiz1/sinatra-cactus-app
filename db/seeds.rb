# will create seed data to work with and test association

# create 2 users

kristin = User.create(name: "Kristin", email: "kristin@kristin.com", password: "password")
grant = User.create(name: "Grant", email: "grant@grant.com", password: "password")

# Create some cactus entries 

CactusEntry.create(content: "Kristin's picture of a cactus will be here", user_id: kristin.id)

# Use AR to pre-associate data: 

kristin.cactus_entries.create(content: "We are building a Sinatra Cactus App! Go Cacti!")

grants_entry = grant.cactus_entries.build(content: "I don't know what Sinatra is!")
grants_entry.save 