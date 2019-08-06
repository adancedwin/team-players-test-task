# What's it all about?
It's one of the test tasks I've done and published on GitHub so far.

# Setup
### 1. Configure database.yml to a database of your choice
After you cloned the project and run installation of gems you need to configure `database.yml`
The project already has `database_default.yml` setup to Postgres database. Just put your postgres username (role) and password.

### 2. Get the app's console up and running
Having configured `database.yml` you need put the following to terminal:
```bash
bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed 
```
Which does all at once: creating databases, running migrations and seeding the database. If you wish you can do one at a time.

Then just run `rails c` in terminal.


### A bit about the task.
There are players. Players belong to teams. Teams play matches (games).
Players may get some sort of achievements done (we'll call it results) while they play a match. Something like "run 10k" or "70% accuracy of a ball being successfully passed".

We need to create Rails models that describe it and enable some features to be used along.

### Here is a quick set of things that we need to be able to do:
1. Record a result for a player to our database;
2. Write a method that answers to a question - did a player achieve a specific result in the last 5 matches for a team? Just Yes or No.
3. Get Top 5 players that achieved a specific result the most often, in one team.
4. Get Top 5 players that achieved a specific result the most often, among all teams.

# How it can be used?
Now have a Rails app (console, to be exact), up and running with our new features onboard.

### 1. Record a result for a player to the database

Here we use the `create` action from our `ResultController`.
So, for example, we have these simple routes:
```ruby
get 'result', to: 'result#new'
post 'result', to: 'result#create'
```
That gives us the following paths:
```ruby
new_result_path
create_result_path
```
Which we use to first initialize a result object to later save it. 

In theory, it's possible to use controllers through routes in rails console. Though the last isn't recomended since reliability of avalailble ways to do so is not guaranteed.


### 2. Write a method that answers to a question - did a player achieve a specific result in the last 5 matches for a team? Just Yes or No.

That's where our rails console is useful.
To do so you need to call `achieved_result_in_last_matches?` on an instance of Player - specifying result (string) and optionally quantity of matches:
```ruby
Player.first.achieved_result_in_last_matches?('run_ten_km', 3) # second argument - matches_amount is optional, by default it's 5
```
We get a boolean value returned.


### 3. Get Top 5 players that achieved a specific result the most often, in one team.
Here you use a class method `top_by_result_one_team` - where you pass a team object, result (string) and optionally quantity of players:
```ruby
PlayerResult.top_by_result_one_team(Team.first, 'run_ten_km', 6) # third argument - players_amount is optional, by default it's 5
```
We get players' objects returned.

### 4. Get Top 5 players that achieved a specific result the most often, among all teams.
Again, a class method, this time call `top_by_result_all_teams` - where you pass result (string) and optionally quantity of players:
```ruby
PlayerResult.top_by_result_all_teams('run_ten_km', 4) # second argument - players_amount is optional, by default it's 5
```
We get players' objects returned.
