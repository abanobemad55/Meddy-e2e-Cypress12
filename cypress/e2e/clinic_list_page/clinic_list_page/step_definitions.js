import {When, Then, Given} from "@badeball/cypress-cucumber-preprocessor";
import credentials from "../../../fixtures/authentication.json";
import {
    confirmBooking,
    createBooking,
    getB1G1patient2CouponCode,
    getPatient,
    patient2CouponCode
} from "../../../utlis/bookings";
import {DOCTORS, PAGES_PREFIX, DISCOUNTS, PATIENTS} from "../../../utlis/types";
import patients from "../../../fixtures/patients.json";
import doctors from "../../../fixtures/doctors.json";

When("I go to clinics page", () => {
    cy.visit("/clinics");
})


When("I click on Specialization", () => {
    cy.xpath("//*[@id='SpecializationTrigger']").click({force: true})
})


When("I click on Insurance", () => {
    cy.xpath("//*[@id='InsuranceTrigger']").click({force: true})
})

When("I click on Area", () => {
    cy.xpath("//*[@id='AreaTrigger']").click({force: true})
})


Then("I click on Clear Button for Area", () => {
    cy.get('.desk-filter-subfilter-wrapper > .button-overlay-wrapper > .button-overlay-inner-wrapper > #AreaTrigger > .clear-filter-icon').click()
})

Then("I click on Clear Button for Insurance", () => {
    cy.get('.desk-filter-subfilter-wrapper > .button-overlay-wrapper > .button-overlay-inner-wrapper > #InsuranceTrigger > .clear-filter-icon').click()
})









