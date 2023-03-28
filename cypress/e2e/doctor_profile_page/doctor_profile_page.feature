Feature: Doctor Profile Page

  @positive @doctor_Profile_page @level_1
  Scenario: 1.Open normal doctor and submit booking as Regesterd user
    Given I am logged in as a patient
    And I go to doctor "zainab-awni" submit booking page
    When I click on "Book Now"
    And I Choose the "Clinic Visit" option
    And I enter Patient Name
    And I Select insurance
    And I click on "Submit Booking"
    Then I should see booking submitted page

  @positive @doctor_Profile_page @level_1
  Scenario: 2.Open normal doctor and booking via view price
    Given I am logged in as a patient
    And I go to doctor "zainab-awni" submit booking page
    When I click on "View Prices"
    And I click on "Book Now"
    And I Choose the "Clinic Visit" option
    And I enter Patient Name
    And I Select insurance
    Then I click on "Submit Booking"
    Then I should see booking submitted page


  @positive @doctor_Profile_page @level_1
  Scenario: 4.Open normal doctor and Add new reveiw - Satisfied
    Given I am logged in as a patient
    And I go to doctor "bassem-hmiedan" submit booking page
    When I click on "Satisfied"
    And I Write my Comment "Best Doctor Ever"
    And I click on "Publish Review"
    Then I should see this Massage "Your review has been submitted successfully"
    Then I delete the review

  @positive @doctor_Profile_page @level_1
  Scenario: 5.Open normal doctor and Add new reveiw - Neutral
    Given I am logged in as a patient
    And I go to doctor "bassem-hmiedan" submit booking page
    When I click on "Neutral"
    And I Write my Comment "Not Bad"
    And I click on "Publish Review"
    Then I should see this Massage "Your review has been submitted successfully"
    Then I delete the review

  @positive @doctor_Profile_page @level_1
  Scenario: 6.Open normal doctor and Add new review - Unsatisfied
    Given I am logged in as a patient
    And I go to doctor "bassem-hmiedan" submit booking page
    When I click on "Unsatisfied"
    And I Write my Comment "worest doctor ever"
    And I click on "Publish Review"
    Then I should see this Massage "Your review has been submitted successfully"
    Then I delete the review
    
  @Negative @doctor_Profile_page @level_1
  Scenario: 8.Open normal doctor and Add new review without choose states
    Given I am logged in as a patient
    And I go to doctor "bassem-hmiedan" submit booking page
    When I Write my Comment "worest doctor ever"
    And I click on "Publish Review"
    Then I should see this Massage "You need to choose one of the following"

  # @Negative @doctor_Profile_page @level_1
  # Scenario: 9.User delete the comment
  #   Given I am logged in as a patient
  #   And I go to doctor "bassem-hmiedan" submit booking page
  #   When I click on "Unsatisfied"
  #   And I Write my Comment "worest doctor ever"
  #   And I click on "Publish Review"
  #   Then I should see this Massage "Your review has been submitted successfully"
  #   Then I delete the review

  # @Negative @doctor_Profile_page @level_1
  # Scenario: 9.User read comment
  #   Given I am logged in as a patient
  #   And I go to doctor "zainab-awni" submit booking page
  #   When I click on "Unsatisfied"
  #   And I Write my Comment "worest doctor ever"
  #   And I click on "Publish Review"
  #   Then I should see this Massage "worest doctor ever"
  #   And I click on "Delete"
  #   And I click on "Yes"

  # OTP issue
  # @Negative @doctor_Profile_page @level_1
  # Scenario: 10.Open normal doctor and submit booking as unRegesterd user
  #   Given I am not logged in
  #   When I open HeliumDoc Website
  #   And I go to normal Doctor page
  #   Then I click on "Book Now"
  #   And I fill-in my mobile number
  #   And I click on Next
  #   Then I fill in PIN
  #   And I click on Verify My Mobile Number
  #   And I Choose the "Clinic Visit" option
  #   And I enter Patient Name
  #   And I Select insurance
  #   And I Select Gender
  #   And I click on "Submit Booking"
  #   Then I should see booking submitted page

  # OTP issue
  # @positive @doctor_Profile_page @level_1
  # Scenario: 11.Open normal doctor and booking via view price
  #   Given I am not logged in
  #   When I open HeliumDoc Website
  #   And I go to normal Doctor page
  #   When I click on "View Prices"
  #   Then I click on "Book Now"
  #   And I fill-in my mobile number
  #   And I click on Next
  #   Then I fill in PIN
  #   And I click on Verify My Mobile Number
  #   And I Choose the "Clinic Visit" option
  #   And I enter Patient Name
  #   And I Select insurance
  #   And I Select Gender
  #   And I click on "Submit Booking"
  #   Then I should see booking submitted page

  @positive @doctor_Profile_page @level_1
  Scenario: 12.Open normal doctor and Check if location is exist
    Given I am logged in as a patient
    When I open HeliumDoc Website
    And I go to normal Doctor page
    Then I should see "View on Google Maps"



