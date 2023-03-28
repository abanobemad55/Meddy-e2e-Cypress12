import { Given, When, Then, Before } from "@badeball/cypress-cucumber-preprocessor";
import credentials from "../../../fixtures/authentication.json";

When("I go to login page", () => {
    cy.visit('/login');
});

Then("I should see the login page", () => {
    cy.contains('Welcome Back!').should('be.visible')
})

Then("I should see  the signup page", () => {

})

When("I fill in email address", () => {
    cy.getByPlaceholder("Enter Email").type(credentials.normalUserWithEmail.email)


})
When("I fill in {string} as email address", (email) => {
    cy.getByPlaceholder("Enter Email").type(email)

})

When("I fill in password", () => {
    cy.getByPlaceholder("Enter Password").type(credentials.normalUserWithEmail.password)
})

When("I fill in {string} as password", (password) => {
    cy.getByPlaceholder("Enter Password").type(password)
})

When("I click on Log in", () => {
    cy.get("[type='submit']").contains('Log in').click()
})

When("I fill in phone number for an account with password", () => {
    cy.getByPlaceholder("Add your Mobile Number").type(credentials.normalUserWithEmail.phoneNumber)

})
When("I fill in phone number for an account without password", () => {
    cy.getByPlaceholder("Add your Mobile Number").type(credentials.normalUserWithPhone.phoneNumber)
})


Then("Input should not be valid", () => {
    cy.get('input:invalid').shadow().should('have.length', 1)
})

Then("I should see password field", () => {
    cy.get("[placeholder='Enter Password']")
})

Then("I should see the Arabic login page", () => {
    cy.percySnapshot('Arabic Login Page')
})

Then("I should be logged in", () => {
    const accessToken = localStorage.getItem('accessToken')
    expect(accessToken).to.not.be.null
    cy.contains('Log in').should('not.exist')
    cy.contains('Sign up').should('not.exist')
})

When(/^I click on user dropdown menu$/, () => {
    cy.get('#userDropdown').click();
});