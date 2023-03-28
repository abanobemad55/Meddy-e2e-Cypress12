Feature: My appointments page
    As a user, I want to view and manage my appointments from My appointments page

    Scenario: 1.View a list of my upcoming appointments
        Given I am logged in as a patient
        When I go to My appointments page
        Then I should see a list of my upcoming appointments

    Scenario: 2.View a list of my completed appointments
        Given I am logged in as a patient
        When I go to My appointments page
        And I click on completed appointments tab
        Then I should see a list of my completed appointments

    Scenario: 3.View a list of my cancelled appointments
        Given I am logged in as a patient
        When I go to My appointments page
        And I click on cancelled appointments tab
        Then I should see a list of my cancelled appointments

    Scenario: 4.Cancel an upcoming appointment and choosing cancellation reason
        Given I am logged in as a patient
        When I go to My appointments page
        And I click on cancel appointment for any upcoming appointment
        Then I should see a confirmation message
        When I click on "Cancel My Appointment"
        And I choose cancellation reason
        And I click on "Yes, Cancel"
        Then I should be redirected to cancellation confirmation page
        And I should see "Appointment Cancelled"

    Scenario: 5.Cancel an upcoming appointment with choosing "Other" reason
        Given I am logged in as a patient
        When I go to My appointments page
        And I click on cancel appointment for any upcoming appointment
        And I click on "Cancel My Appointment"
        And I choose other cancellation reason
        And I enter other reason in the text box
        And I click on "Yes, Cancel"
        Then I should be redirected to cancellation confirmation page
        And I should see "Appointment Cancelled"

    Scenario: 6.Rescedule an upcoming appointment
        Given I am logged in as a patient
        And I went to instant doctor submit booking page and selected the time
        And I click on "Submit Booking"
        When I go to My appointments page
        And I click on "Reschedule Appointment"
        And I choose reschedule day and time
        And I click on Reschedule appointment button
        Then I should see "Appointment Rescheduled"