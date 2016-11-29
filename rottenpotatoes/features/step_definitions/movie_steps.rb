# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
  step %Q{I should see "#{title}"}
  step %Q{I should see "#{director}"}
end


Then /I should see "(.*)" before "(.*)"/ do |movie1, movie2|
  page.body.index(movie1).should < page.body.index(movie2)
end

When /I press  "(.*)" on "(.*)" / do |movie|
  Movie.destroy(movie)
end
# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split.each do |rating|
    step %Q{I #{uncheck}check "ratings_#{rating}"}
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  page.should have_content(movies-table)
end
