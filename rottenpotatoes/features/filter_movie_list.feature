Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

Background: movies have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | Watchman                | R      | 6-Mar-2009   |
  | The Matrix              | R      | 31-Mar-1999  |
  | Finding Nemo            | G      | 30-May-2003  |
  | The Mummy               | PG-13  | 7-May-1999   |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | Die Hard                | R      | 20-Jul-1988  |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And  I am on the RottenPotatoes home page

Scenario: restrict to movies with 'PG' or 'R' ratings
  # enter step(s) to check the 'PG' and 'R' checkboxes
  When I check the following ratings: PG R
  # enter step(s) to uncheck all other checkboxes
  And I uncheck the following ratings: G PG-13 NC-17
  # enter step to "submit" the search form on the homepage
  And I press "Refresh"
  # enter step(s) to ensure that PG and R movies are visible
  Then I should see "The Terminator"
  And I should see "Watchman"
  And I should see "The Matrix"
  And I should see "Die Hard"
  And I should see "Raiders of the Lost Ark"
  # enter step(s) to ensure that other movies are not visible
  And I should not see "Aladdin"
  And I should not see "The Mummy"
  And I should not see "2001: A Space Odyssey"
  And I should not see "Chicken Run"
  

Scenario: all ratings selected
  # see assignment
  # enter step(s) to check all checkboxes
  When I check the following ratings: PG R G PG-13 NC-17
  # enter step to "submit" the search form on the homepage
  And I press "Refresh"
  # enter step(s) to ensure that all movies are visible
  Then I should see "The Terminator"
  And I should see "Watchman"
  And I should see "The Matrix"
  And I should see "Die Hard"
  And I should see "Raiders of the Lost Ark"
  And I should see "Aladdin"
  And I should see "The Mummy"
  And I should see "2001: A Space Odyssey"
  And I should see "Chicken Run"
