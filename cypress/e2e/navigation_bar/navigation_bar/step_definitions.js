import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";
import doctors from '../../../fixtures/doctors.json'
import clinics from '../../../fixtures/clinics.json'

const country = Cypress.env('country');

When(/^I click on the Specialities DDL in the header$/, () => {
	cy.get('#specDropdown').click();
});

Then(/^I should see the Specialities list$/, () => {
	cy.get('#specDropdown').parent().should('have.class', 'dropdown jumbo open');
});

Then(/^I should be redirected to join doctors page$/, () => {
	cy.url().should('contain', `/join-doctors`)
});

Then(/^I should be redirected to login page$/, () => {
	cy.url().should('contain', `/login`)
});

Then(/^I should be redirected to Sign up page$/, () => {
	cy.url().should('contain', `/signup`)
});

When("I enter {string} in the search bar", (searchKeyword) => {
	cy.get('#search-text-desk').type(searchKeyword);
	cy.wait(500)
});

When(/^I click on first search result$/, () => {
cy.get('.search-result').first().click({force: true});
});

When(/^I enter doctor's name in the search bar$/, () => {
	let doctorName = doctors[country].normalDoctor.slug
	cy.get('#search-text-desk').type(doctorName);
	cy.wait(500)
});

Then(/^I should be redirected to the doctor's profile page$/, () => {
	let doctorSlug = doctors[country].normalDoctor.slug
	cy.url().should('contain', `/${doctorSlug}`)
});

When(/^I enter clinic's name in the search bar$/, () => {
	let clinicName = clinics[country].normalClinic.slug
	cy.get('#search-text-desk').type(clinicName);
	cy.wait(1000)
});

Then(/^I should be redirected to the clinic's profile page$/, () => {
	let clinicSlug = clinics[country].normalClinic.name
	cy.url().should('contain', `/clinic/${clinicSlug.toLowerCase().replaceAll(" ", '-')}`)
});

When(/^I enter speciality in the search bar$/, () => {
	cy.get('#search-text-desk').type('Audiologist');
	cy.wait(500)
});

Then(/^I should be redirected to the doctors with that speciality page$/, () => {
	cy.url().should('contain', `/doctors/audiologist`)
});
