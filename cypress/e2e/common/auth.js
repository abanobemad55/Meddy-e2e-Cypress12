import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor';
import {loginByEmail} from "../../utlis/login";

Given('I am logged in as a patient', () => {
    loginByEmail()
    // cy.wait(3000)
})

Given("I am not logged in", () => {
    cy.clearCookies()
    cy.clearLocalStorage()
})

When("I fill in {string} as phone number", (phoneNumber) => {
    cy.getByPlaceholder("Add your Mobile Number").type(phoneNumber)
})