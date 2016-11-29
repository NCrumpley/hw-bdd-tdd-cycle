Feature: delete movies from database
 
  As an avid moviegoer
  So that I can see real releases
  I want to be able to delete fake movie entries

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
  | Car Wars                | R      | 20-Feb-1978  |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And I am on the RottenPotatoes home page
  
  Scenario: delete fake movie
  When I press "Delete" on "Car Wars"
  Then I should not see "Car Wars"
