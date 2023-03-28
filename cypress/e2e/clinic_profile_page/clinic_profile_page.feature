Feature: Clinic Profile Page

    @positive @clinic_Profile_page @level_1
    Scenario: 1.View clinic location on map from clinic profile
        Given I am logged in as a patient
        When I go to normal clinic profile page
        Then I should see "View on Google Maps"

    @positive @clinic_Profile_page @level_1
    Scenario: 2.View clinic working hours of the clinic from clinic profile
        Given I am logged in as a patient
        When I go to normal clinic profile page
        Then I should see working hours of the clinic

    @positive @clinic_Profile_page @level_1
    Scenario: 3.View services of the clinic from clinic profile
        Given I am logged in as a patient
        When I go to normal clinic profile page
        Then I should see list of services offered by the clinic

    @positive @clinic_Profile_page @level_1
    Scenario: 4.View Languages Spoken at the clinic from clinic profile
        Given I am logged in as a patient
        When I go to normal clinic profile page
        Then I should see list of languages spoken at the clinic

    @positive @clinic_Profile_page @level_1
    Scenario: 5.View doctors of the clinic from clinic profile
        Given I am logged in as a patient
        When I go to normal clinic profile page
        Then I should see doctors of the clinic

    @positive @clinic_Profile_page @level_1
    Scenario: 6.Open doctor profile page from clinic profile
        Given I am logged in as a patient
        When I go to normal clinic profile page
        And I visit doctor profile from clinic page
        Then I should be redirected to doctor profile page

    @positive @clinic_Profile_page @level_1
    Scenario: 7.View list of available specialities from clinic profile
        Given I am logged in as a patient
        When I go to normal clinic profile page
        Then I should see list of specialties available by the clinic

    @positive @clinic_Profile_page @level_1
    Scenario: 8.View list of available treatments from clinic profile
        Given I am logged in as a patient
        When I go to normal clinic profile page
        Then I should see list of treatments available by the clinic

    @positive @clinic_Profile_page @level_1
    Scenario: 9.View list of insurance providers for the clinic from clinic profile
        Given I am logged in as a patient
        When I go to normal clinic profile page
        Then I should see list of insurance providers available by the clinic

    @positive @clinic_Profile_page @level_1
    Scenario: 10.View list of available medical equipment from clinic profile
        Given I am logged in as a patient
        When I go to normal clinic profile page
        Then I should see list of medical equipment available by the clinic

    @positive @clinic_Profile_page @level_1
    Scenario: 11.Add new booking for any doctor from clinic profile
        Given I am logged in as a patient
        When I go to normal clinic profile page
        And I click on book now button for any doctor
        Then I should be redirected to submit booking page
        When I click on Submit Booking
        Then I should see booking confirmation page
        