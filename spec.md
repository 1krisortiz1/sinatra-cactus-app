Specifications for the Sinatra Assessment
Specs:

X Use Sinatra to build the app
  - Used Sinatra to build my app 
X Use ActiveRecord for storing information in a database
  - Used ActiveRecord
X Include more than one model class (e.g. User, Post, Category)
  - Created a user and cactus entries model
X Include at least one has_many relationship on your User model (e.g. User has_many Posts)
  - A user has many cactus entries
X Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
  - A cactus entry belongs to a user 
X Include user accounts with unique login attribute (username or email)
X Ensure that the belongs_to resource has routes for Creating, Reading,     Updating and Destroying
  - CRUD routes used in cactusentry controller
X Ensure that users can't modify content created by other users
  - Users only see edit or delete when if current user owns the entry
X Include user input validations
  - can't create a user without name, password and email. Can't create a plank entry.
 BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
 Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
 
Confirm

 You have a large number of small Git commits
 Your commit messages are meaningful
 You made the changes in a commit that relate to the commit message
 You don't include changes in a commit that aren't related to the commit message 