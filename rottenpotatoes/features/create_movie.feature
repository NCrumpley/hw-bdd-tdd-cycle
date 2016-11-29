Feature: create new movie

  As a movie viewer
  So that I can add new movies to the database
  I want to enter a new movie

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
  
  And  I am on the RottenPotatoes home page

Scenario: Add a new movie  
    Given I am on the RottenPotatoes home page
    When I follow "Add new movie"
    Then I should be on the Create New Movie page
    When I fill in "Title" with "The Matrix"
    And I select "R" from "Rating"
    And I press "Save Changes"
    Then I should be on the RottenPotatoes home page
    And I should see "The Matrix"