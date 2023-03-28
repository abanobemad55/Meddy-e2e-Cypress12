Feature: Edit profile
    As a user, I want to be able to see my profile, so that I can see my information and edit it.

    Scenario: 1.View edit profile page
        Given I am logged in as a patient
        When I go to edit profile page
        Then I should see my information

    Scenario: 2.Leave Full Name field empty and try to save changes
        Given I am logged in as a patient
        When I go to edit profile page
        And I leave full name field empty
        And click on save changes button
        Then I should see "Name is required"

    Scenario: 3.Edit my Full Name field
        Given I am logged in as a patient
        When I go to edit profile page
        And I edit full name field
        And click on save changes button
        Then I should see "Profile Edited Successfully"
        And I should see my new full name

    # Scenario: 4.Edit my mobile number field and enter wrong pin code
    #     Given I am logged in as a patient
    #     When I go to edit profile page
    #     And I click on change mobile number button
    #     And I enter my new mobile number
    #     And I click on "Next"
    #     And I enter wrong pin code
    #     And I click on "Verify My Mobile Number"
    #     Then I should see "Incorrect PIN."

    # Scenario: 5.Edit my mobile number field and enter correct pin code
    #     Given I am logged in as a patient
    #     When I go to edit profile page
    #     And I click on change mobile number button
    #     And I enter my new mobile number
    #     And I click on "Next"
    #     And I enter correct pin code
    #     And I click on "Verify My Mobile Number"
    #     Then I should see "Mobile number successfully changed"
    #     And the mobile number is updated successfully