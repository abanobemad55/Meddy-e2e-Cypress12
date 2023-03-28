Feature: Terms of use and Privacy policy pages

    Scenario: 1.Open terms of use page
        Given I go to home page
        When I click on "Terms of Use"
        Then I should be redirected to Terms of service page


    Scenario: 2.Navigate to different sections using table of contents of terms page
        Given I go to home page
        When I click on "Terms of Use"
        Then I should be able to navigate to different page sections using the table of contents

    Scenario: 3.Open privacy policy page
        Given I go to home page
        When I click on "Privacy Policy"
        Then I should be redirected to Privacy Policy page

    Scenario: 4.Navigate to different sections using table of contents of terms page
        Given I go to home page
        When I click on "Privacy Policy"
        Then I should be able to navigate to different page sections using the table of contents