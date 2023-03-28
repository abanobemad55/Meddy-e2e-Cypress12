import { When, Then } from '@badeball/cypress-cucumber-preprocessor';

When("I click on {string}", (button) => {
    cy.contains(button, {matchCase: false}).click({force: true});
    // We wait because of resources were not loaded yet it will return a validation error and test will fail
});
Then("I should see the error message {string}", (errorMessage) => {
    cy.containsText(errorMessage)
})

When(/^I go to home page$/, () => {
    cy.visit('/')
});

Then("I fill in PIN", () => {
    cy.get("[name=pin]").type("1234")
})

Then("I fill in wrong PIN", () => {
    cy.get("[name=pin]").type("1111")
})

Then("I should see {string}", (text) => {
    cy.contains(text)
})

Then("I should see error massage {string}", (text) => {
    cy.containsText(text)
})
Then("I should see success message {string}", (text) => {
    cy.containsText(text);
})

Then("I should see homepage", () => {
    cy.contains(/Book Appointments with the Best Doctors in *./)
})

When("I go to Qatar homepage", () => {
    cy.visit("/")
})

When("I go to UAE homepage", () => {
    cy.visit("/uae")
})

When("I go to Qatar Arabic homepage", () => {
    cy.visit("/ar/")
})

When("I go to UAE Arabic homepage", () => {
    cy.visit("/ar/")
})

When("I click on Verify your number", () => {
    cy.getByType("submit").contains("Verify your Number", {matchCase: false}).click()
})
When("I click on Sign up", () => {
    cy.get("a").containsText("Sign up").click()
})



Then("Mixpanel event {string} should be fired", (event)=>{
    cy.get('@mixpanel').should('be.called')
})



When("I Choose {string}", (Text) => {   
    cy.contains(Text).click({force: true})
})
