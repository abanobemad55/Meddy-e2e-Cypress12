import { When, Then, Given } from "@badeball/cypress-cucumber-preprocessor";


When(/^I click on speciality list$/, () => {
    cy.get('[data-cy="Specialty-trigger"]').click()
});


When(/^I click on search button$/, () => {
    cy.get('[data-cy="hero-cta"]').click()
});


When(/^I click on location list$/, () => {
    cy.get('[data-cy="country-trigger"]').click()
});


When(/^I click on video visit button$/, () => {
    cy.get('[data-cy="type-video"]').click()
});


When("I choose {string} from popular spicialities section", (speciality) => {
    cy.get(`[data-cy="${speciality}"]`).click()
});

Then("I should see search with the correct {string}", (speciality) => {
    cy.url().should('include', `/doctors/${speciality}`)
});


When("I choose {string} from {string} section", (speciality, section) => {
    cy.contains(`${section}`).parent().within(() => {
        cy.contains(`${speciality}`).click()
    })
});


Then("I should see a list of featured doctors with {string}", (specialityTag) => {
    cy.get('[data-cy="View all buttons"]').should('have.attr', 'href', `/doctors/${specialityTag}/`)
});

Then("I should see a list of popular clinics with {string}", (specialityTag) => {
    cy.contains(`Popular Clinics`).parent().within(() => {
        cy.get('[class="view-all-btn"]').should('have.attr', 'href', `/clinics/${specialityTag}/`)
    })
});

When("I enter {string} in insurance section", (searchKeyword) => {
	cy.get('input[placeholder="Filter companies or plans"]').type(searchKeyword)
});
