# What's it all about?
It's one of the test tasks I've done and published on GitHub so far.

### A bit about the task.
There are players. Players belong to teams. Teams play matches (games).
Players may get some sort of achievements done (we'll call it results) while playing a match. Like "run 10k" or "70% accuracy of a ball being successfully passed".

We need to create Rails models that describe it and enable some features to be used along.

### Here is a quick set of things that we need to be able to do:
1. Record a result for a player to our database;
2. Write a method that answers to a question - did a player achieve a specific result in the last 5 matches for a team? Just Yes or No.
3. Get Top 5 players that achieved a specific result the most often, in one team.
4. Get Top 5 players that achieved a specific result the most often, among all teams.

# How it can be used?
Let's assume we have a Rails app, up and running with our new features onboard.

### 1. Record a result for a player to our database

Here we use a `create` action from our `ResultController`.
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
Which we use to initialize a result object to later save it.

### 2. Write a method that answers to a question - did a player achieve a specific result in the last 5 matches for a team? Just Yes or No.

To do so you need to call `achieved_result_in_last_matches?` on an instance of Player - specifying result (string) and optionally quantity of matches:
```ruby
@player.achieved_result_in_last_matches?(result, matches = 5)
```
We get a boolean returned.


### 3. Get Top 5 players that achieved a specific result the most often, in one team.
Here you use a class method `top_by_result_one_team` - where you pass a team object, result (string) and optionally quantity of players:
```ruby
PlayerResult.top_by_result_one_team(team, result, players_amount = 5)
```
We get players' objects returned.

### 4. Get Top 5 players that achieved a specific result the most often, among all teams.
Again, a class method, this time call `top_by_result_all_teams` - where you pass result (string) and optionally quantity of players:
```ruby
PlayerResult.top_by_result_all_teams(result, players_amount = 5)
```
We get players' objects returned.
