import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor';
import credentials from "../../../fixtures/authentication.json";

When("I go to signup page", () => {
    cy.visit('/signup');
});

Then("I should see the signup page", () => {
    cy.contains("Welcome to HeliumDoc")
})

When("I click on Verify your Number", () => {
    cy.xpath("//*[@type='submit']").click({force: true})
})

When("I click on Create your account", () => {
    cy.xpath("//*[@id='submit-id-sign_up']").click({force: true})
})

When("I fill in signup form", () => {
    let RundomNumber = Math.floor((Math.random() * 1000000) + 1);
    cy.get("[placeholder='Full Name']").type(credentials.SignupUser.phoneNumber)
    cy.getByType("email").type("Test"+RundomNumber+"@Gmail.com")
    cy.get("[type='password']").type(credentials.SignupUser.password)
    cy.get("[placeholder='Enter your Mobile Number']").type("+97435"+RundomNumber)    
})

When("I fill in invalid signup form with old Email", () => {
    cy.getByType("email").type("abanob@test.com")
    let RundomNumber = Math.floor((Math.random() * 1000000) + 1);
    cy.get("[placeholder='Full Name']").type(credentials.SignupUser.phoneNumber)
    cy.get("[type='password']").type(credentials.SignupUser.password)
    cy.get("[placeholder='Enter your Mobile Number']").type("+97435"+RundomNumber)    
})


When("I fill in invalid signup form with old Phone number", () => {
    let RundomNumber = Math.floor((Math.random() * 1000000) + 1);
    cy.get("[placeholder='Full Name']").type(credentials.SignupUser.phoneNumber)
    cy.getByType("email").type("Test"+RundomNumber+"@Gmail.com")
    cy.get("[type='password']").type(credentials.SignupUser.password)
    cy.get("[placeholder='Enter your Mobile Number']").type(credentials.normalUserWithEmail.phoneNumber) 
})


When("I fill in invalid signup form with new phone number and without email", () => {
    let RundomNumber = Math.floor((Math.random() * 1000000) + 1);
    cy.get("[placeholder='Full Name']").type(credentials.SignupUser.phoneNumber)
    cy.get("[type='password']").type(credentials.SignupUser.password)
    cy.get("[placeholder='Enter your Mobile Number']").type("+97435"+RundomNumber)   
})

When("I fill in invalid signup form with new email and phone number and without name", () => {
    let RundomNumber = Math.floor((Math.random() * 1000000) + 1);
    cy.get("[type='password']").type(credentials.SignupUser.password)
    cy.getByType("email").type("Test"+RundomNumber+"@Gmail.com")
    cy.get("[placeholder='Enter your Mobile Number']").type(credentials.normalUserWithEmail.phoneNumber)
})


When("I fill in invalid signup form with new email and phone number and without password", () => {
    let RundomNumber = Math.floor((Math.random() * 1000000) + 1);
    cy.get("[placeholder='Full Name']").type(credentials.SignupUser.phoneNumber)
    cy.getByType("email").type("Test"+RundomNumber+"@Gmail.com")
    cy.get("[placeholder='Enter your Mobile Number']").type(credentials.normalUserWithEmail.phoneNumber)
})

Then(/^I can't procced to next step$/, () => {
	cy.wait(2000)
    cy.url().should('contain', '/signup')
});

Then("I should be logged in", () => {
    const accessToken = localStorage.getItem('accessToken')
    expect(accessToken).to.not.be.null
    cy.contains('Log in').should('not.exist')
    cy.contains('Sign up').should('not.exist')
})