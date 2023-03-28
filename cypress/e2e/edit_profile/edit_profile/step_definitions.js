import { When, Then, Before } from "@badeball/cypress-cucumber-preprocessor";

const API_URL = Cypress.env('backend_url');


When(/^I go to edit profile page$/, () => {
    cy.visit('/me/profile/edit');
});

When(/^I leave full name field empty$/, () => {
    cy.get('[id="full_name"] input').clear();
});

When(/^click on save changes button$/, () => {
    cy.get("form [id=submit_edit_profile]").click()
});

Then(/^I should see my information$/, () => {
    cy.contains('Edit Profile').should('exist');
    cy.get('[id="full_name"]').should('exist');
});

When(/^I edit full name field$/, () => {
    let newName = `Abanob Emad ` + Math.floor(Math.random() * 1000);
    cy.wrap(newName).as('newName');
    cy.get('[id="full_name"] input').clear().type(newName);
});

Then(/^I should see my new full name$/, () => {
    cy.get('@newName').then((newName) => {
        cy.get('[id="full_name"] input').should('have.value', newName);
    });
});

When(/^I click on change mobile number button$/, () => {
    cy.get('[id="mobile_number"] button').click();
});

When(/^I enter my new mobile number$/, () => {
    let newMobileNumber = `35` + Math.floor(111111 + Math.random() * 888888);
    cy.wrap(newMobileNumber).as('newMobileNumber');
    cy.get('[placeholder="Enter your mobile number"]').type(newMobileNumber);
});

When(/^I enter wrong pin code$/, () => {
    cy.get("[name=pin]").type("1111")
});

When(/^I enter correct pin code$/, () => {
    cy.get("[name=pin]").type("1234")
});


Then(/^the mobile number is updated successfully$/, () => {
    cy.get('@newMobileNumber').then((newMobileNumber) => {
        cy.get('[id="mobile_number"] input').should('have.value', `${newMobileNumber}`);
        // cy.readFile('cypress/fixtures/authentication.json').then((users) => {
        //     users.normalUserWithEmail.phoneNumber = newMobileNumber;
        //     cy.writeFile('cypress/fixtures/authentication.json', users);
        // })
    })
});
