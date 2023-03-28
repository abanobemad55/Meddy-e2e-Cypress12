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


When("I go to doctor list page", () => {
    cy.visit(`/doctors`);
})

Then("I Choose Clinic", () => {
    cy.get('.button-overlay-wrapper > .button-overlay-inner-wrapper > .generic-overlay > #overlay-options-container > .overlay-option:nth-child(2)').click()
})

