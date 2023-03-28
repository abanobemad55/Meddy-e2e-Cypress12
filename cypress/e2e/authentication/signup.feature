Feature: signup page

  # OTP issue
#  Scenario: The patient tries to signup with new email and phone number and verify the number
#    When I go to signup page
#    Then I should see the signup page
#    When I fill in signup form
#    Then I click on "Create your account"
#    Then I should see "Verify your Number"
#    When I fill in PIN
#    And I click on Verify your Number
#    Then I should see homepage
#    And I should be logged in

 Scenario: The patient tries to signup with an old email
   When I go to signup page
   When I fill in invalid signup form with old Email
   Then I click on Create your account
   Then I should see error massage "A user with that email already exists."

 Scenario: The patient tries to signup with an old phone number
   When I go to signup page
   When I fill in invalid signup form with old Phone number
   Then I click on Create your account
   Then I should see error massage "A user with this number already exists."

  @Navigation
  Scenario: Test Navigation from Qatar Homepage to Signup Page
    Given I am not logged in
    When I go to Qatar homepage
    When I click on Sign up
    Then I should see the signup page
    And I should see "Create your account"

  # OTP issue
#  Scenario: The patient tries to signup with new phone number and without email
#    When I go to signup page
#    Then I should see the signup page
#    When I fill in invalid signup form with new phone number and without email
#    And  I click on Create your account
#    Then I should see "Verify your Number"
#    When I fill in PIN
#    And I click on Verify your Number
#    Then I should see homepage
#    And I should be logged in

 Scenario: The patient tries to signup with new email and phone number and without name
   Given I go to signup page
   Then I should see the signup page
   When I fill in invalid signup form with new email and phone number and without name
   And I click on Create your account
   Then I can't procced to next step

 Scenario: The patient tries to signup with new email and phone number and without password
   Given I go to signup page
   Then I should see the signup page
   When I fill in invalid signup form with new email and phone number and without password
   And I click on Create your account
   Then I can't procced to next step

  # OTP issue
#  Scenario: The patient tries to signup with new email and phone number and wrong PIN number
#    Given I go to signup page
#    Then I should see the signup page
#    When I fill in signup form
#    And  I click on Create your account
#    Then I should see "Verify your Number"
#    When I fill in wrong PIN
#    And I click on Verify your Number
#    Then I should see error massage "Incorrect PIN. Please enter a correct PIN or click to resend if you haven't received one."



