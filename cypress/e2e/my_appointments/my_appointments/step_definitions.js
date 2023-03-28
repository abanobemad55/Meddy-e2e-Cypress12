import { Given, When, Then, Before } from "@badeball/cypress-cucumber-preprocessor";

const API_URL = Cypress.env('backend_url');

import doctors from '../../../fixtures/doctors.json'

Before(() => {
    cy.intercept('GET', `${API_URL}/patient/user_bookings/upcoming/`).as('upcomingAppointments');
    cy.intercept('GET', `${API_URL}/patient/user_bookings/visited/`).as('completedAppointments');
    cy.intercept('GET', `${API_URL}/patient/user_bookings/cancelled/`).as('cancelledAppointments');
});

When(/^I go to My appointments page$/, () => {
    cy.visit('/me/appointments/');
});

Then(/^I should see a list of my upcoming appointments$/, () => {
    cy.wait('@upcomingAppointments').its('response').then((res) => {
        let upcomingAppointments = res.body.user_bookings;
        cy.get('.appointment-content').should('have.length', upcomingAppointments.length);
    })
});

When(/^I click on completed appointments tab$/, () => {
    cy.contains('Completed').click();
});

Then(/^I should see a list of my completed appointments$/, () => {
    cy.wait('@completedAppointments').its('response').then((res) => {
        let completedAppointments = res.body.user_bookings;
        cy.get('.appointment-content').should('have.length', completedAppointments.length);
    })
});


When(/^I click on cancelled appointments tab$/, () => {
    cy.contains('Cancelled').click();
});

Then(/^I should see a list of my cancelled appointments$/, () => {
    cy.wait('@cancelledAppointments').its('response').then((res) => {
        let cancelledAppointments = res.body.user_bookings;
        cy.get('.appointment-content').should('have.length', cancelledAppointments.length);
    })
});


When(/^I click on cancel appointment for any upcoming appointment$/, () => {
    cy.get('.cancel-appointment').first().click();
});

Then(/^I should see a confirmation message$/, () => {
    cy.get('[data-cy="cancel-appointment-text"]').should('be.visible');
});

When(/^I choose cancellation reason$/, () => {
    cy.get(".default-radio").eq(Math.floor(Math.random() * 4)).click()
});


Then(/^I should be redirected to cancellation confirmation page$/, () => {
    cy.url().should('include', 'appointments/cancellation');
});

When(/^I choose other cancellation reason$/, () => {
    cy.get(".default-radio").eq(5).click()
});

When(/^I enter other reason in the text box$/, () => {
    cy.get('[name=other-reason]').type('Other reason');
});

Given(/^I went to instant doctor submit booking page and selected the time$/, () => {
    let doctorSlug = doctors['qatar'].instantDoctor.slug
    cy.visit(`/bookings/submit_booking/doctor/${doctorSlug}/`);
    cy.get('[class="booking-type-details"]').contains('Clinic Visit').click()
    // cy.contains('Show next availability').click()
    cy.get('[class="time-button available"]').first().click()
});

When(/^I choose reschedule day and time$/, () => {
    cy.get('[class*="month-container"]').eq(2).click();
    cy.get('[class*="hour-container"]').first().click();
});


When(/^I click on Reschedule appointment button$/, () => {
    cy.wait(500)
    cy.get('[type="tel"]').type('{enter}');
});

