# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app 
- #Used corneal gem to start, then modified files on a need be basis.
- [x] Use ActiveRecord for storing information in a database 
- #Wrote migrations for my models and created tables then seeded the tables.
- [x] Include more than one model class (e.g. User, Post, Category)
- #I currently have a User model and a Reminder model.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
- #My User has_many reminders
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
- #My Reminder belongs_to a user.
- [x] Include user accounts with unique login attribute (username or email)
- #I have a user login or signup with a username, email, and password for authentication.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- #Once logged-in the user can create, read, update, and destroy reminders.
- [x] Ensure that users can't modify content created by other users
- #A user's id is checked to match the foreign key of the reminder. If they do not match, then the user has no access.
- [x] Include user input validations
- #Users are validated with a username, email, and password. If any of these attributes are left blank, then the user is not validated.
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message