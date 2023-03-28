Feature: Uploaded Documents Page

    @positive @uploaded_documents_page @level_1
    Scenario: 1.Open uploaded documnets page and upload id images
        Given I am logged in as a patient
        When I open uploaded documents page
        And I upload the front side of id
        And I upload the back side of id
        Then I should see the uploaded id images

    @positive @uploaded_documents_page @level_1
    Scenario: 2.Open uploaded documnets page and passport instead of id images
        Given I am logged in as a patient
        When I open uploaded documents page
        And I click on "Upload Passport"
        And I upload the passport
        Then I should see the uploaded passport

    @positive @uploaded_documents_page @level_1
    Scenario: 3.Open uploaded documnets page and upload insurance document
        Given I am logged in as a patient
        When I open uploaded documents page
        And I go to insurance tab
        And I upload the insurance document
        Then I should see the uploaded insurance document

    @positive @uploaded_documents_page @level_1
    Scenario: 4.Open uploaded documnets page and upload medical reports
        Given I am logged in as a patient
        When I open uploaded documents page
        And I go to medical reports tab
        And I upload the medical reports
        Then I should see the uploaded medical reports