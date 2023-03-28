Feature: Page footer

    @positive @footer
    Scenario Outline: 1.Browse docotors by specialty <Speciality> from the page footer
        Given I am not logged in
        When I go to home page
        And I choose "<Speciality>" from the page footer
        Then I should be redirected to "<SpecialityTag>" page
        Examples:
            | Speciality     | SpecialityTag                 |
            | OBGYN          | obstetrician+and+gynecologist |
            | Pediatricians  | pediatrician                  |
            | Dermatologists | dermatologist                 |
            | Dentists       | general+dentist               |

    @positive @footer
    Scenario Outline: 2.Browse docotors by area <Area> from the page footer
        Given I am not logged in
        When I go to home page
        And I choose "<Area>" from the page footer
        Then I should be redirected to "<AreaTag>" page
        Examples:
            | Area       | AreaTag    |
            | Abu Hamour | abu+hamour |
            | Duhail     | duhail     |
            | Al Waab    | al+waab    |
            | Al Sadd    | al+sadd    |

    Scenario: 3.Visit careers page from the page footer
        Given I am not logged in
        When I go to home page
        And I choose "Careers" from the page footer
        Then I should be redirected to careers page

    Scenario: 4.Visit Blog page from the page footer
        Given I am not logged in
        When I go to home page
        And I choose "Blog" from the page footer
        Then I should be redirected to the blog page

    Scenario: 5.Visit Terms of use page from the page footer
        Given I am not logged in
        When I go to home page
        And I choose "Terms of Use" from the page footer
        Then I should be redirected to the Terms of use page
        And I should see "Terms of Service"

    Scenario: 6.Visit Privacy Policy page from the page footer
        Given I am not logged in
        When I go to home page
        And I choose "Privacy Policy" from the page footer
        Then I should be redirected to the Privacy Policy page
        And I should see "Privacy Policy"

    Scenario: 7.Visit For Doctors page from the page footer
        Given I am not logged in
        When I go to home page
        And I choose "For Doctors" from the page footer
        Then I should be redirected to join doctors page

    Scenario: 8.Visit Widgets page from the page footer
        Given I am not logged in
        When I go to home page
        And I choose "Widgets" from the page footer
        Then I should be redirected to widgets page
        And I should see "Doctor and Clinics Widgets"

    Scenario: 9.Visit Clinics page from the page footer
        Given I am not logged in
        When I go to home page
        And I choose "Clinics" from the page footer
        Then I should be redirected to clinics page
        And I should see "Best Clinics in Doha, Qatar"