# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
#
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
#
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======
# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========
# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Represented by agent
# ====================
# Christian Bale

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all
Agent.destroy_all

# Generate models and tables, according to the domain model.
warner_bros = Studio.new
warner_bros["name"] = "Warner Bros."
warner_bros.save
# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
batman_begins = Movie.new
batman_begins["title"] = "Batman Begins"
batman_begins["year_released"] = 2005
batman_begins["rated"] = "PG-13"
batman_begins["studio_id"] = warner_bros.id
batman_begins.save
p batman_begins

dark_knight = Movie.new
dark_knight["title"] = "The Dark Knight"
dark_knight["year_released"] = 2008
dark_knight["rated"] = "PG-13"
dark_knight["studio_id"] = warner_bros.id
dark_knight.save

dark_knight_rises = Movie.new
dark_knight_rises["title"] = "The Dark Knight Rises"
dark_knight_rises["year_released"] = 2012
dark_knight_rises["rated"] = "PG-13"
dark_knight_rises["studio_id"] = warner_bros.id
dark_knight_rises.save

# Generate actors
christian_bale = Actor.new
christian_bale["name"] = "Christian Bale"
christian_bale.save

michael_caine = Actor.new
michael_caine["name"] = "Michael Caine"
michael_caine.save

liam_neeson = Actor.new
liam_neeson["name"] = "Liam Neeson"
liam_neeson.save

katie_holmes = Actor.new
katie_holmes["name"] = "Katie Holmes"
katie_holmes.save

gary_oldman = Actor.new
gary_oldman["name"] = "Gary Oldman"
gary_oldman.save

# Batman Begins
bruce_wayne = Role.new
bruce_wayne["movie_id"] = batman_begins.id
bruce_wayne["actor_id"] = christian_bale.id
bruce_wayne["character_name"] = "Bruce Wayne"
bruce_wayne.save
p bruce_wayne

alfred = Role.new
alfred["movie_id"] = batman_begins.id
alfred["actor_id"] = michael_caine.id
alfred["character_name"] = "Alfred"
alfred.save

ras_al_ghul = Role.new
ras_al_ghul["movie_id"] = batman_begins.id
ras_al_ghul["actor_id"] = liam_neeson.id
ras_al_ghul["character_name"] = "Ra's Al Ghul"
ras_al_ghul.save

rachel_dawes = Role.new
rachel_dawes["movie_id"] = batman_begins.id
rachel_dawes["actor_id"] = katie_holmes.id
rachel_dawes["character_name"] = "Rachel Dawes"
rachel_dawes.save

commissioner_gordon = Role.new
commissioner_gordon["movie_id"] = batman_begins.id
commissioner_gordon["actor_id"] = gary_oldman.id
commissioner_gordon["character_name"] = "Commissioner Gordon"
commissioner_gordon.save

# The Dark Knight
heath_ledger = Actor.new
heath_ledger["name"] = "Heath Ledger"
heath_ledger.save

aaron_eckhart = Actor.new
aaron_eckhart["name"] = "Aaron Eckhart"
aaron_eckhart.save

maggie_gyllenhaal = Actor.new
maggie_gyllenhaal["name"] = "Maggie Gyllenhaal"
maggie_gyllenhaal.save

# The Dark Knight roles
tdk_bruce_wayne = Role.new
tdk_bruce_wayne["movie_id"] = dark_knight.id
tdk_bruce_wayne["actor_id"] = christian_bale.id
tdk_bruce_wayne["character_name"] = "Bruce Wayne"
tdk_bruce_wayne.save!

joker = Role.new
joker["movie_id"] = dark_knight.id
joker["actor_id"] = heath_ledger.id
joker["character_name"] = "Joker"
joker.save!

harvey_dent = Role.new
harvey_dent["movie_id"] = dark_knight.id
harvey_dent["actor_id"] = aaron_eckhart.id
harvey_dent["character_name"] = "Harvey Dent"
harvey_dent.save!

tdk_alfred = Role.new
tdk_alfred["movie_id"] = dark_knight.id
tdk_alfred["actor_id"] = michael_caine.id
tdk_alfred["character_name"] = "Alfred"
tdk_alfred.save!

tdk_rachel_dawes = Role.new
tdk_rachel_dawes["movie_id"] = dark_knight.id
tdk_rachel_dawes["actor_id"] = maggie_gyllenhaal.id
tdk_rachel_dawes["character_name"] = "Rachel Dawes"
tdk_rachel_dawes.save!

#The Dark Knight Rises

tom_hardy = Actor.new
tom_hardy["name"] = "Tom Hardy"
tom_hardy.save!

joseph_gordon_levitt = Actor.new
joseph_gordon_levitt["name"] = "Joseph Gordon-Levitt"
joseph_gordon_levitt.save!

anne_hathaway = Actor.new
anne_hathaway["name"] = "Anne Hathaway"
anne_hathaway.save!

# The Dark Knight Rises roles
tdkr_bruce_wayne = Role.new
tdkr_bruce_wayne["movie_id"] = dark_knight_rises.id
tdkr_bruce_wayne["actor_id"] = christian_bale.id
tdkr_bruce_wayne["character_name"] = "Bruce Wayne"
tdkr_bruce_wayne.save!

tdkr_commissioner_gordon = Role.new
tdkr_commissioner_gordon["movie_id"] = dark_knight_rises.id
tdkr_commissioner_gordon["actor_id"] = gary_oldman.id
tdkr_commissioner_gordon["character_name"] = "Commissioner Gordon"
tdkr_commissioner_gordon.save!

bane = Role.new
bane["movie_id"] = dark_knight_rises.id
bane["actor_id"] = tom_hardy.id
bane["character_name"] = "Bane"
bane.save!

john_blake = Role.new
john_blake["movie_id"] = dark_knight_rises.id
john_blake["actor_id"] = joseph_gordon_levitt.id
john_blake["character_name"] = "John Blake"
john_blake.save!

selina_kyle = Role.new
selina_kyle["movie_id"] = dark_knight_rises.id
selina_kyle["actor_id"] = anne_hathaway.id
selina_kyle["character_name"] = "Selina Kyle"
selina_kyle.save!

ari_emanuel = Agent.new
ari_emanuel["name"] = "Ari Emanuel"
ari_emanuel.save!

christian_bale["agent_id"] = ari_emanuel.id
christian_bale.save!

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
for movie in Movie.all
  studio = Studio.find(movie.studio_id)
  puts "#{movie.title} #{movie.year_released} #{movie.rated} #{studio.name}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
for role in Role.all
  actor = Actor.find(role.actor_id)
  movie = Movie.find(role.movie_id)
  puts "#{movie.title} #{actor.name} #{role.character_name}"
end

# Prints a header for the agent's list of represented actors output
puts ""
puts "Represented by agent"
puts "===================="
puts ""

# Query the actor data and loop through the results to display the agent's list of represented actors output.
represented_actor = Actor.where.not({agent_id: nil})
for actor in represented_actor
  puts "#{actor.name}"
end