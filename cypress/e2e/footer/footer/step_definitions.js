import {When, Then, Given} from "@badeball/cypress-cucumber-preprocessor";


When("I choose {string} from the page footer", (speciality) => {
	cy.get('[class=footer]').contains(speciality).click();
});

Then("I should be redirected to {string} page", (speciality) => {
	cy.url().should('contain', `/doctors/${speciality}/`)
});

Then(/^I should be redirected to careers page$/, () => {
	cy.url().should('contain', `/jobs`)
});

Then(/^I should be redirected to the blog page$/, () => {
	cy.url().should('contain', `hakeem.heliumdoc.com`)
});

Then(/^I should be redirected to the Terms of use page$/, () => {
	cy.url().should('contain', `/terms`)
});

Then(/^I should be redirected to the Privacy Policy page$/, () => {
	cy.url().should('contain', `/privacy`)
});


Then(/^I should be redirected to join doctors page$/, () => {
	cy.url().should('contain', `/join-doctors`)
});

Then(/^I should be redirected to widgets page$/, () => {
	cy.url().should('contain', `/widget`)
});

Then(/^I should be redirected to clinics page$/, () => {
	cy.url().should('contain', `/clinics`)
});
