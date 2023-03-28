Feature: Clinic List Page

  @positive @Clinic_list @level_1
  Scenario: 1.Open Clinic list and search for Clinic by Specialization
  Given I am not logged in
  When I go to clinics page
  And I click on Specialization
  And I Choose "Audiologist"
  Then I should see "Best Audiology Clinics in Doha, Qatar"



  @positive @Clinic_list @level_1
  Scenario: 2.Open Clinic list and search for Clinic by Insurance
  Given I am not logged in
  When I go to clinics page
  And I click on Insurance
  And I Choose "Aetna"
  Then I should see "Best Clinics that accept Aetna in Doha, Qatar"

  @positive @Clinic_list @level_1
  Scenario: 3.Open Clinic list and search for Clinic by Area
  Given I am not logged in
  When I go to clinics page
  And I click on Area
  And I Choose "Abu Hamour"
  Then I should see "Best Clinics located in Abu Hamour in Doha, Qatar"

@positive @Clinic_list @level_1
  Scenario: 4.Open clinic list and press view clinic 
  Given I am not logged in
  When I go to clinics page
  And I click on "View Clinic"
  Then I should see "Address"

  @Negative @Clinic_list @level_1
  Scenario: 5.Open Clinic list and search for Clinic by Area and Clear it
  Given I am not logged in
  When I go to clinics page
  And I click on Area
  And I Choose "Abu Hamour"
  Then I should see "Best Clinics located in Abu Hamour in Doha, Qatar"
  And I click on Clear Button for Area

  @Negative @Clinic_list @level_1
  Scenario: 6.Open Clinic list and search for Clinic by Insurance and Clear it
  Given I am not logged in
  When I go to clinics page
  And I click on Insurance 
  And I Choose "Aetna"
  Then I should see "Best Clinics that accept Aetna in Doha, Qatar"
  And I click on Clear Button for Insurance

  @Negative @Clinic_list @level_1
  Scenario: 7.Open Clinic list and search for Clinic by Area , Insurance
  Given I am not logged in
  When I go to clinics page
  And I click on Area 
  And I Choose "Abu Hamour"
  And I click on Insurance
  And I Choose "Aetna"
  Then I should see "Best Clinics that accept Aetna located in Abu Hamour in Doha, Qatar"

  @Negative @Clinic_list @level_1
  Scenario: 8.Open Clinic list and search for Clinic by Area , Specialization
  Given I am not logged in
  When I go to clinics page
  And I click on Specialization
  And I Choose "Audiologist"
  And I click on Area
  And I Choose "Abu Hamour"
  Then I should see "Best Audiology Clinics located in Abu Hamour in Doha, Qatar"

  @Negative @Clinic_list @level_1
  Scenario: 9.Open Clinic list and search for Clinic by Insurance , Specialization
  Given I am not logged in
  When I go to clinics page
  And I click on Specialization
  And I Choose "Audiologist"
  And I click on Insurance 
  And I Choose "Aetna"
  Then I should see "Best Audiology Clinics that accept Aetna in Doha, Qatar"

  @Negative @Clinic_list @level_1
  Scenario: 10.Open Clinic list and search for Clinic by Insurance , Specialization and area
  Given I am not logged in
  When I go to clinics page
  And I click on Specialization
  And I Choose "Audiologist"
  And I click on Insurance
  And I Choose "Aetna"
  And I click on Area
  And I Choose "Abu Hamour"
  Then I should see "Best Audiology Clinics that accept Aetna located in Abu Hamour in Doha, Qatar"

























  






