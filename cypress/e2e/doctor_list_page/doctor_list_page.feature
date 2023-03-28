Feature: Doctor Page list

  @positive @doctor_list_page @level_1
  Scenario: 1.change Spcialty at doctor page list
    Given I am not logged in
    And I go to doctor list page
    When I click on "Speciality"
    And I Choose "Audiologist"
    Then I should see "Best Audiologists in Doha, Qatar"

  @positive @doctor_list_page @level_1
  Scenario: 2.change visit type at doctor page list
    Given I am not logged in
    And I go to doctor list page
    When I click on "Visit Type"
    And I Choose "Clinic and Video"
    Then I should see "Clinic and Video"

  @positive @doctor_list_page @level_1
  Scenario: 3.change Treatment at doctor page list
    Given I am not logged in
    And I go to doctor list page
    When I click on "Speciality"
    And I Choose "Audiologist"
    And I click on "Treatment"
    And I Choose "Hearing Aids"
    Then I should see "Best Audiologists for Hearing Aids"

  @positive @doctor_list_page @level_1
  Scenario: 4.change insurance at doctor page list
    Given I am not logged in
    And I go to doctor list page
    When I click on "Insurance"
    And I Choose "Aetna"
    And I Choose "Any Plan"
    Then I should see "Best Doctors insured by Aetna"


  @positive @doctor_list_page @level_1
  Scenario: 5.change Area at doctor page list
    Given I am not logged in
    And I go to doctor list page
    When I click on "Area"
    And I Choose "Abu Hamour"
    Then I should see "Best Doctors located in Abu Hamour in Doha, Qatar"


  @positive @doctor_list_page @level_1
  Scenario: 6.change Sub Specialization at doctor page list
    Given I am not logged in
    And I go to doctor list page
    When I click on "More Filters"
    And I Choose "Sub Specialization"
    And I Choose "Andrology"
    And I click on "Apply Filter"
    Then I should see "Best Doctors specialized in Andrology in Doha, Qatar"

  @positive @doctor_list_page @level_1
  Scenario: 7.change Clinic at doctor page list
    Given I am not logged in
    And I go to doctor list page
    When I click on "More Filters"
    And I Choose Clinic
    And I Choose "Al-Aaj Dental Center"
    And I click on "Apply Filter"
    Then I should see "Best Doctors in Al-Aaj Dental Center Doha, Qatar"

  @positive @doctor_list_page @level_1
  Scenario: 8.change nationality at doctor page list
    Given I am not logged in
    And I go to doctor list page
    When I click on "More Filters"
    And I Choose "Nationality"
    And I Choose "Algeria"
    And I click on "Apply Filter"
    Then I should see "Best Doctors Algerian"

  @positive @doctor_list_page @level_1
  Scenario: 9.change Language at doctor page list
    Given I am not logged in
    And I go to doctor list page
    When I click on "More Filters"
    And I Choose "Language"
    And I Choose "Arabic"
    And I click on "Apply Filter"
    Then I should see "Best Doctors Arabic speaking in Doha, Qatar"


  @positive @doctor_list_page @level_1
  Scenario: 10.change Gender at doctor page list
    Given I am not logged in
    And  I go to doctor list page
    When I click on "More Filters"
    And I Choose "Gender"
    And I Choose "Male"
    And I click on "Apply Filter"
    Then I should see "Best Doctors male in Doha, Qatar"


  @Negative @doctor_list_page @level_1
  Scenario: 11.Apply more than fillter for doctors
    Given I am not logged in
    And I go to doctor list page
    When I click on "Speciality"
    And I Choose "Audiologist"
    And I click on "Visit Type"
    And I Choose "Clinic and Video"
    And I click on "Treatment"
    And I Choose "Hearing Aids"
    Then I should see "Best Audiologists for Hearing Aids in Doha, Qatar"

  @Negative @doctor_list_page @level_1
  Scenario: 12.Clear all fillters for doctors
    Given I am not logged in
    And I go to doctor list page
    When I click on "Speciality"
    And I Choose "Audiologist"
    And I click on "Visit Type"
    And I Choose "Clinic and Video"
    And I click on "Treatment"
    And I Choose "Hearing Aids"
    And I click on "Clear All"
    Then I should see "Best Audiologists in Doha, Qatar"


  @Negative @doctor_list_page @level_1
  Scenario: 13.Clear all more fillters for doctors
    Given I am not logged in
    And I go to doctor list page
    When I click on "More Filters"
    And I Choose "Sub Specialization"
    And I Choose "Andrology"
    And I click on "Clear All"
    Then I should see "Best Doctors in Doha, Qatar"

  @Negative @doctor_list_page @level_1
  Scenario: 14.User check Doctor view profile
    Given I am not logged in
    And I go to doctor list page
    When I click on " View Profile "
    Then I should see "Book Now"

  @Negative @doctor_list_page @level_1
  Scenario: 15.User try to book a Doctor from doctor profile
    Given I am not logged in
    And I go to doctor list page
    When I click on "Book Now"
    Then I should see "Start by entering your mobile number"





