import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor';


Given("Setup test data",() => {
    cy.request('GET', `${Cypress.env('backend_url')}/setup_test_data`)
        .then((response) => {
            const setupData = response.body;
            cy.wrap(setupData).as('setupData');
        });
});