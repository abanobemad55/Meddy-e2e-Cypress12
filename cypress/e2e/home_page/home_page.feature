Feature: Home Page features

    @positive @home_page
    Scenario: 1.Search doctors speciality without location
        Given I am not logged in
        When I go to home page
        And I click on speciality list
        And I Choose "Audiologist"
        And I click on search button
        Then I should see "Best Audiologists in Doha, Qatar"

    @positive @home_page
    Scenario: 2.Search doctors speciality with location
        Given I am not logged in
        When I go to home page
        And I click on location list
        And I Choose "Ain Khaled"
        And I click on speciality list
        And I Choose "Audiologist"
        And I click on search button
        Then I should see "Best Audiologists located in Ain Khaled in Doha, Qatar"

    @positive @home_page
    Scenario: 3.Search doctors speciality with video visit flag
        Given I am not logged in
        When I go to home page
        And I click on video visit button
        And I click on speciality list
        And I Choose "Audiologist"
        And I click on search button
        Then I should see "Video Only"

    @positive @home_page
    Scenario Outline: 4.Filter doctors by <Speciality> from popular specialities section
        Given I am not logged in
        When I go to home page
        And I choose "<Speciality>" from popular spicialities section
        Then I should see search with the correct "<Speciality>"
        Examples:
            | Speciality                    |
            | obstetrician+and+gynecologist |
            | pediatrician                  |
            | general+practitioner          |
            | general+dentist               |
            | dermatologist                 |
            | ophthalmologist               |

    @positive @home_page
    Scenario Outline: 5.Filter doctors by <Speciality> from featured doctors section
        Given I am not logged in
        When I go to home page
        And I choose "<Speciality>" from "Featured Doctors" section
        Then I should see a list of featured doctors with "<SpecialityTag>"
        Examples:
            | Speciality      | SpecialityTag                 |
            | OBGYN           | obstetrician+and+gynecologist |
            | Pediatricians   | pediatrician                  |
            | General Doctors | general+practitioner          |
            | Dentists        | general+dentist               |
            | Skin Doctors    | dermatologist                 |
            | Eye Doctors     | ophthalmologist               |

    @positive @home_page
    Scenario Outline: 6.Filter clinics by <Speciality> from popular clinics section
        Given I am not logged in
        When I go to home page
        And I choose "<Speciality>" from "Popular Clinics" section
        Then I should see a list of popular clinics with "<SpecialityTag>"
        Examples:
            | Speciality      | SpecialityTag                 |
            | OBGYN           | obstetrician+and+gynecologist |
            | Pediatricians   | pediatrician                  |
            | General Doctors | general+practitioner          |
            | Dentists        | general+dentist               |
            | Skin Doctors    | dermatologist                 |
            | Eye Doctors     | ophthalmologist               |

    @positive @home_page
    Scenario: 7.Search insurance companies by company name
        Given I am not logged in
        When I go to home page
        And I enter "AXA" in insurance section
        Then I should see "AXA 1"

    @positive @home_page
    Scenario: 8.Search insurance companies by plan
        Given I am not logged in
        When I go to home page
        And I enter "Bronze" in insurance section
        Then I should see "Aetna"
        * I should see "MedNet"
        * I should see "MSH"