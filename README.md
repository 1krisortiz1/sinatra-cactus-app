Cactus Application Project
	[X] 1. Build an MVC Sinatra application.
	[X] 2. Use ActiveRecord with Sinatra.
	[X] 3. Use multiple models.
		- User and cactus_entry models
	[X] 4. Use at least one has_many relationship on a User model and 			   one belongs_to relationship on another model.
		- User model has_many cactus_entries
		- Cactus_Entry model belongs_to a user
	[X] 5. Must have user accounts - users must be able to sign up, sign in, and sign out.
		- User can sign up, sign in, and sign out
	[X] 6. Validate uniqueness of user login attribute (username or email).
		- User is authenicated using the authenticate method at log in.
	[X] 7. Once logged in, a user must have the ability to create, read, update and destroy the resource that belongs_to user.
		- User can create, read, updated, and destroy only their logs.
	[X] 8. Ensure that users can edit and delete only their own resources - not resources created by other users.
		- Using the current_user helper method to verify the user in the current session.  If current user then user is able to edit and delete.
	[X] 9. Validate user input so bad data cannot be persisted to the database.
	[X] 10. BONUS: Display validation failures to user with error messages. (This is an optional feature, challenge yourself and give it a shot!)


Getting Started
Git Clone
Bundle Install
Shotgun

Built With
	• Sinatra
	• ActiveRecord
	• Sqlite
	• RESTful routes
	• Sessions
	
License
This project is licensed under the MIT License

