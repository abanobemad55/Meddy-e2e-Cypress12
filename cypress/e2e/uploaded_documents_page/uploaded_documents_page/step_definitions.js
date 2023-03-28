import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";

function checkIfDocumentIsUploaded() {
    cy.get("[class=upload-container]").then($body => {
        if ($body.find("[alt='Remove Image']").length > 0) {
            cy.log('Document is uploaded, deleting it...')
            cy.get('[alt="Remove Image"]').click({ multiple: true });
        }
    });
}

When(/^I open uploaded documents page$/, () => {
    cy.visit('/me/profile/uploaded_documents/')
});

When(/^I upload the front side of id$/, () => {
    // check if there is a document uploaded first and delete it
    checkIfDocumentIsUploaded()

    cy.get('[value="Upload ID"]').should('be.visible');
    cy.get('[class*=desk-only]')
        .find('[id=id-image-1]')
        .selectFile('cypress/fixtures/id.jpg', { force: true });
});

When(/^I upload the back side of id$/, () => {
    cy.get('[value="Upload the Other Side"]').should('be.visible');
    cy.get('[class*=desk-only]')
        .find('[id=id-image-2]')
        .selectFile('cypress/fixtures/id.jpg', { force: true });
});

Then(/^I should see the uploaded id images$/, () => {
    cy.get('[alt="Upload Again"]').should('have.length', 2);
});


When(/^I upload the passport$/, () => {
    cy.get('[class*=desk-only]')
        .find('[id=passport-image-1]')
        .selectFile('cypress/fixtures/passport.png', { force: true });
});

Then(/^I should see the uploaded passport$/, () => {
    cy.get('[alt="Upload Again"]').should('have.length', 1);
});

When(/^I go to insurance tab$/, () => {
    cy.contains('INSURANCE').click();
});

When(/^I upload the insurance document$/, () => {
    // check if there is a document uploaded first and delete it
    checkIfDocumentIsUploaded()

    cy.get('[value="Upload Insurance"]').should('be.visible');
    cy.get('[class*=desk-only]')
        .find('[id=insurance-image]')
        .selectFile('cypress/fixtures/dummy.pdf', { force: true });
});

Then(/^I should see the uploaded insurance document$/, () => {
    cy.get('[alt="Upload Again"]').should('have.length', 1);
});

When(/^I go to medical reports tab$/, () => {
    cy.contains('Medical Reports').click();
});

When(/^I upload the medical reports$/, () => {
    checkIfDocumentIsUploaded()

    cy.get('[value="Upload Medical Reports"]').should('be.visible');
    cy.get('[class*=desk-only]')
        .find('[id=upload-record-btn]')
        .selectFile('cypress/fixtures/dummy.pdf', { force: true });
});

Then(/^I should see the uploaded medical reports$/, () => {
    cy.get('[alt="Upload Again"]').should('have.length', 1);
});
