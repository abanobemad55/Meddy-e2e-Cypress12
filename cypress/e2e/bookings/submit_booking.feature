Feature: Submit Booking

  # OTP issue
  # @positive @submit_booking @level_1 @normal_doctor @clinic
  # Scenario: 1. Submit a normal clinic booking for a new user
  #   Given I am not logged in
  #   When I go to a normal doctor submit booking page
  #   And I click on Clinic Visit
  #   And I fill in my mobile number
  #   And I click on Next
  #   And I fill in PIN
  #   And I click on Verify My Mobile Number
  #   And I fill in patient full name
  #   And I choose gender
  #   And I choose no insurance option
  #   And I click on "Submit Booking"
  #   Then I should see booking submitted page

  # OTP issue
  # @positive @submit_booking @level_1 @normal_doctor @clinic
  # Scenario: 2. Submit a normal clinic booking while logged out for an existing user
  #   Given I am not logged in
  #   When I go to a normal doctor submit booking page
  #   And I click on Clinic Visit
  #   And I fill in my mobile number with used number
  #   And I click on Next
  #   And I fill in PIN
  #   And I click on Verify My Mobile Number
  #   And I fill in patient full name
  #   And I choose gender
  #   And I choose no insurance option
  #   And I click on "Submit Booking"
  #   Then I should see booking submitted page

  @positive @submit_booking @level_1 @normal_doctor @clinic
  Scenario: 3. Submit a normal clinic booking while logged in
    Given I am logged in as a patient
    When I go to a normal doctor submit booking page
    When I click on Clinic Visit
    And I fill in patient full name
    And I choose gender
    And I choose no insurance option
    And I click on "Submit Booking"
    Then I should see booking submitted page

  @positive @submit_booking @level_1 @walkin @clinic
  Scenario: 4. Submit a walk-in clinic booking while logged in
    Given I am logged in as a patient
    When I go to a walk-in doctor submit booking page
    And I click on Clinic Visit
    And I fill in patient full name
    And I choose gender
    And I choose no insurance option
    And I click on "Submit Booking"
    Then I should see booking submitted page

  @positive @submit_booking @level_1 @instant @clinic
  Scenario: 5. Submit an instant clinic booking while logged in
    Given I am logged in as a patient
    When I go to an instant doctor submit booking page
    And I click on Clinic Visit
    And I fill in patient full name
    And I choose gender
    And I choose no insurance option
    And I choose time slot for the booking
    And I click on "Submit Booking"
    Then I should see booking submitted page


  #   # ======================================================================================
  #   #   Video booking         #    #
  #   #   positive testing      #    #
  @positive @submit_booking @level_1 @normal_doctor @video
  Scenario: 6. Submit a normal video visit booking while logged in
    Given I am logged in as a patient
    When I go to a video doctor submit booking page
    And I click on Video Visit
    And I click on Submit Booking
    And I fill in patient full name
    And I choose gender
    And I choose no insurance option
    When I click on Submit Booking
    Then I should see payment page
    When I fill payment form
    And I agree terms and conditions
    And I click on "Submit Payment Information"
    Then I should see my appointments page
    And I should see the new booking
    # Then I should see booking submitted page

  @positive @submit_booking @level_1 @walkin @video
  Scenario: 7. Submit a walkin video visit booking while logged in
    Given I am logged in as a patient
    When I go to a walkin video doctor submit booking page
    And I click on Video Visit
    And I click on Submit Booking
    And I fill in patient full name
    And I choose gender
    And I choose no insurance option
    When I click on Submit Booking
    Then I should see payment page
    When I fill payment form
    And I agree terms and conditions
    And I click on "Submit Payment Information"
    Then I should see my appointments page
    And I should see the new booking
    # Then I should see booking submitted page

  #   # ======================================================================================
  #   #   Discount booking         #    #
  #   #   positive testing         #    #
  @positive @submit_booking @level_1 @normal_doctor @discount
  Scenario: 8. Submit a normal doctor with discount booking while logged in
    Given I am logged in as a patient
    When I go to a normal doctor with discount submit booking page
    And I click on Clinic Visit
    And I click on Submit Booking
    And I fill in patient full name
    And I choose gender
    And I choose no insurance option
    When I click on Submit Booking
    Then I should see booking submitted page

  @positive @submit_booking @level_1 @walkin @discount
  Scenario: 9. Submit a walkin doctor with discount booking while logged in
    Given I am logged in as a patient
    When I go to a walkin doctor with discount submit booking page
    And I click on Clinic Visit
    And I click on Submit Booking
    And I fill in patient full name
    And I choose gender
    And I choose no insurance option
    When I click on Submit Booking
    Then I should see booking submitted page

  #   # ======================================================================================
  #   #     Video payment with promo code     #    #
  #   #     positive testing                  #    #
  # # PromoCode need to be updated with new promocode
  @positive @submit_booking @level_1 @video @promo
  Scenario: 10. Submit a video visit booking with a percentage promo code while logged in for an existing user
    Given I am logged in as a patient
    When I go to a video doctor submit booking page
    And I click on Video Visit
    And I fill in patient full name
    And I choose gender
    And I choose no insurance option
    And I click on Submit Booking
    Then I should see payment page
    When I fill in a percentage promo code
    And I fill payment form
    And I agree terms and conditions
    And I click on "Submit Payment Information"
    Then I should see "Cancel Appointment"

  @positive @submit_booking @level_1 @video @promo
  Scenario: 11. Submit a video visit booking with a flat promo code while logged in for an existing user
    Given I am logged in as a patient
    When I go to a video doctor submit booking page
    And I click on Video Visit
    And I choose gender
    And I click on Submit Booking
    Then I should see payment page
    When I fill in a flat promo code
    And I fill payment form
    And I agree terms and conditions
    And I click on "Submit Payment Information"
    Then I should see my appointments page
    And I should see the new booking


  # #     # Normal booking with custom patient price
    # OTP issue
  # #   @positive @submit_booking @level_2
  # Scenario: 12. Submit a normal clinic booking with a doctor that supports custom patient price
  #   Given I am not logged in
  #   When I go to a normal doctor with old patients custom price support submit booking page
  #   And I click on Clinic Visit
  #   And I fill in my mobile number
  #   And I click on Next
  #   And I fill in PIN
  #   And I click on Verify My Mobile Number
  #   And I fill in patient full name
  #   And I choose gender
  #   And I choose no insurance option
  #   And I click on Submit Booking
  #   Then I should see booking submitted page

