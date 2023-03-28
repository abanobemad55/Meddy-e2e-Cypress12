Feature: Navigation bar of the page
    User can navigate to the different pages of the site from the header

    Scenario: 1. User open specialities list from the navigation bar
        Given I go to home page
        When I click on the Specialities DDL in the header
        Then I should see the Specialities list

    Scenario: 2. User open "For doctors" page from the navigation bar
        Given I go to home page
        When I click on "For doctors"
        Then I should be redirected to join doctors page

    Scenario: 3. User open "Log in" page from the navigation bar
        Given I go to home page
        When I click on "Log in"
        Then I should be redirected to login page

    Scenario: 4. User open "Sign up" page from the navigation bar
        Given I go to home page
        When I click on "Sign up"
        Then I should be redirected to Sign up page

    Scenario: 5. User search with doctor's name in the search bar
        Given I go to home page
        When I enter doctor's name in the search bar
        And I click on first search result
        Then I should be redirected to the doctor's profile page
        And I should see "Book Now"

    Scenario: 6. User search with clinic's name in the search bar
        Given I go to home page
        When I enter clinic's name in the search bar
        And I click on first search result
        Then I should be redirected to the clinic's profile page

    Scenario: 7. User search with speciality in the search bar
        Given I go to home page
        When I enter speciality in the search bar
        And I click on first search result
        Then I should be redirected to the doctors with that speciality page
    