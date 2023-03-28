Feature: Login page

  Scenario: The patient tries to login using an email that has been registered before
    When I go to login page
    Then I should see the login page
    When I click on "with Email"
    And I fill in email address
    And I fill in password
    And I click on Log in
    Then I should see homepage

  Scenario: The patient tries to login using an email that hasn't been registered before
    When I go to login page
    And I click on "with Email"
    And I fill in "wrong@meddy.com" as email address
    And I fill in password
    And I click on Log in
    Then I should see error massage "Email and password are not correct"

  Scenario: The patient tries to login using a phone number that has been registered with password
    When I go to login page
    Then I should see the login page
    When I click on "With Phone"
    And I fill in phone number for an account with password
    And I click on Log in
    When I fill in password
    And I click on Log in
    Then I should see homepage

  Scenario: The patient tries to login using a phone number that hasn't been registered before
    When I go to login page
    And I click on "With Phone"
    And I fill in "+97455533666" as phone number
    And I click on Log in
    Then I should see the error message "User doesn't exist!"

  # OTP issue
  # Scenario: The patient tries to login using OTP instead of a password and phone number that has been registered with password
  #   When I go to login page
  #   And I fill in phone number for an account with password
  #   And I click on Log in
  #   Then I should see password field
  #   When I click on "use OTP instead?"
  #   And I fill in PIN
  #   And I click on Verify your number
  #   Then I should see homepage

  # OTP issue
  # Scenario: The patient tries to login using password instead of OTP and phone number that has been registered with password
  #   When I go to login page
  #   And I click on "With Phone"
  #   And I fill in phone number for an account with password
  #   And I click on Log in
  #   Then I should see password field
  #   When I click on "Use OTP instead?"
  #   And I click on "Use password instead?"
  #   And I fill in password
  #   And I click on Log in
  #   Then I should see homepage

  # OTP issue
  # Scenario: The patient tries to login using a phone number that has been registered with OTP
  #   When I go to login page
  #   And I fill in phone number for an account without password
  #   And I click on Log in
  #   And I fill in PIN
  #   And I click on Verify your number
  #   Then I should see homepage

  # OTP issue
  # Scenario: The patient tries to resend pin number
  #   When I go to login page
  #   And I fill in phone number for an account without password
  #   And I click on Log in
  #   And I click on "resend pin by SMS"
  #   Then I should see success message "OTP has been sent to your number"

  Scenario: The patient tries to add phone number with country code
    When I go to login page
    And I fill in phone number for an account with password
    And I click on Log in
    Then I should see password field

  Scenario: The patient tries to add wrong password
    When I go to login page
    And I fill in phone number for an account with password
    And I click on Log in
    Then I should see password field
    When I fill in "xxxx" as password
    And I click on Log in
    Then I should see error massage "Email and password are not correct. Note that both fields may be case-sensitive."

  Scenario: The patient tries to add wrong PIN
    When I go to login page
    And I fill in phone number for an account without password
    And I click on Log in
    Then I should see "Verify your Number"
    When I fill in wrong PIN
    And I click on Verify your number
    Then I should see error massage "Incorrect PIN. Please enter a correct PIN or click to resend if you haven't received one."

  Scenario: The patient tries to logout from the website
    Given I am logged in as a patient
    When I go to home page
    And I click on user dropdown menu
    And I click on "Logout"
    Then I should see "Log in"


#  Scenario: The patient tries to reset password using email
#    When I go to login page
#    Then I should see the login page
#    When I click on "With Email"
#    Then I should see the login page
#    And I click on forgot password
#    Then I should navigate to password recovery page
#    When I click to with Email tab
#    And I fill in email address
#    And click on recover password
#    Then I should see "Reset link sent"
#    And I should receive an email
#    Then Clean test data
#
#  Scenario: The patient tries to reset password using phone
#    Given Email has been registered
#    When I  navigate to login page
#    Then I should see the login page
#    When I select country
#    And I fill in phone number
#    And I click on Log in
#    Then I should see password field
#    And I click on forgot password
#    Then I should navigate to password recovery page
#    When I select country
#    And I fill in phone number
#    And click on recover password
#    Then I should see "Reset link sent"
#
#    Then Clean test data
#
#  Scenario: The patient tries to reset password from the link that has been resent
#    Given link has been resent from SMS
#    When I opened the sms link
#    Then I should see
#    When I fill in the reset password form
#
#  Scenario: The patient tries to reset password from the expired link that has been resent
#    Given Expired link has been resent from SMS
#    When I opened the sms link
#    And I fill in the reset password form