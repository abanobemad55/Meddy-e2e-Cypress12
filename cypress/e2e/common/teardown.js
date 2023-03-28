import { Given, When, Then } from '@badeball/cypress-cucumber-preprocessor';

Then("Clean test data",()=>{
    // TODO: refactor hard coded URL
    cy.request("https://bandar.stagefelbayt.com/clean/")
})