import {When, Then, Given} from "@badeball/cypress-cucumber-preprocessor";
import clinics from "../../../fixtures/clinics.json";
let clinicSlug = clinics['qatar'].normalClinic.slug
let clinicName = clinics['qatar'].normalClinic.name

When(/^I go to normal clinic profile page$/, () => {
    cy.visit(`/clinic/${clinicSlug}`)
});


When(/^I visit doctor profile from clinic page$/, () => {
	cy.get('[class*=listings-view-cta]').first().click();
});

Then(/^I should be redirected to doctor profile page$/, () => {
	cy.contains('View Prices').should('be.visible');
});

Then(/^I should see working hours of the clinic$/, () => {
    cy.contains(`Working Hours at ${clinicName}`).should('be.visible');
    cy.get('[class*=available-times]').should('be.visible');
});

Then(/^I should see doctors of the clinic$/, () => {
	cy.contains(`${clinicName} Doctors`).should('be.visible');
    cy.get('[class*=doctor-card]').should('be.visible');
});

Then(/^I should see list of services offered by the clinic$/, () => {
	cy.contains(`${clinicName} Services`).should('be.visible');
    cy.get('[class=service-pill]').should('be.visible');
});

Then(/^I should see list of languages spoken at the clinic$/, () => {
    cy.contains(`Languages Spoken at ${clinicName}`).should('be.visible');
    cy.get('[class*=language-link]').should('be.visible');
});

Then(/^I should see list of specialties available by the clinic$/, () => {
    cy.get('[class*=doctor-spec]').should('be.visible');
});

Then(/^I should see list of treatments available by the clinic$/, () => {
    cy.contains(`${clinicName} Treatments`).should('be.visible');
    cy.get('[class=treatment-spec-header]').should('be.visible');
});

Then(/^I should see list of insurance providers available by the clinic$/, () => {
    cy.contains(`${clinicName} Insurance Providers`).should('be.visible');
    cy.get('[class*=insurance-generic]').should('be.visible');
});

Then(/^I should see list of medical equipment available by the clinic$/, () => {
    cy.contains(`${clinicName} Medical Equipment`).should('be.visible');
    cy.get('[class*=clinic-profile-equipment]').should('be.visible');
});

When(/^I click on book now button for any doctor$/, () => {
	cy.get('[class*=listings-book-now]').first().click();
});

Then(/^I should be redirected to submit booking page$/, () => {
	cy.url().should('include', 'bookings/submit_booking');
});

Then("I should see booking confirmation page", () => {
    cy.url().should('include', '/booking-confirmation')
})

When("I click on Submit Booking", () => {
    cy.wait(2000)
    cy.get("[class*=booking-submit]").click({ force: true })
})