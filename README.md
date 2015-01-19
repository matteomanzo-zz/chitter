Chitter!
========
Based on how Twitter works, this challenge aims to manage an account, where the user can sign up, log in and log out, write posts and check the peeps in a chronological order.

Features
--------
- In order to use chitter as a maker I want to sign up to the service
- In order to user chitter as a maker I want to log in
- In order to avoid others using my account as a maker I want to log out
- In order to let people know what I am doing as a maker I want to post a message (peep) to chitter
- In order to see what people have to say as a maker I want to see all peeps in chronological order 

Notes
-----
- Users sign up with their email, password, name and user name
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.
- Use bcrypt to secure the passwords.
- Use data mapper and postgres to save the data.
- You don't have to be logged in to see the peeps.
- You only can peep if you are logged in.