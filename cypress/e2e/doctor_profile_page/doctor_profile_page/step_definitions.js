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

When("I go to normal Doctor page", () => {
    cy.get('[class="search-input"]').type('zainab-awni')
    cy.wait(2000)
    cy.contains("Zainab Awni").click({ force: true })
})


When("I open HeliumDoc Website", () => {
    cy.visit("/")
})


When("I Choose the {string} option", (ButtonName) => {
    cy.contains(ButtonName).click({ force: true })
})


When("I Select insurance", () => {
    cy.wait(2000)
    cy.get('div > .form-group > .insurance-radio-buttons > .default-radio > #noLabel').click({ force: true })
})


Then("I should see Support Number {string}", (PhoneNumber) => {
    cy.contains(PhoneNumber)
})

// Then("I should see {string}", (Text) => {
//     cy.contains(Text)
// })

When("I Write my Comment {string}", (text) => {
    cy.get("[name=comment]").type(text,{force: true})    
})

Then("I should see this Massage {string}", (massage) => {
    cy.contains(massage)
})


When("I enter Patient Name", () => {
    cy.wait(2000)
    cy.get('.booking-form-inner > #bookingFormFirstStep > div > .form-group > #bookingName').clear()
    cy.get('.booking-form-inner > #bookingFormFirstStep > div > .form-group > #bookingName').type('Abanob Emad')
    
})
When("I go to doctor {string} submit booking page", (text) => {
    cy.visit("https://stage2.stagefelbayt.com/"+text+"/");
})

// When("I fill in my mobile number", () => {
//     let Number = Math.floor(Math.random() * 8888) + 1111;
//     cy.xpath("//*[@type='tel']").type("+97435"+Number)
// })

When("I fill-in my mobile number", () => {
    let RundomNumber = Math.floor((Math.random() * 899999) + 111111);
    cy.xpath("//*[@type='tel']").type("35" + RundomNumber)
})

When("I fill in my Pin {string}", (PIN) => {
    cy.wait(2000)
    cy.xpath("//*[@placeholder='Enter your PIN Number']").type(PIN)
})

When("I Select Gender", () => {
    cy.get("label").contains('Male').click()
})

When("I click on Verify My Mobile Number", () => {
    cy.wait(2000)
    cy.xpath("//*[@name='verify']").click({ force: true })
})

When("I click on Next", () => {
    cy.wait(2000)
    cy.xpath("//*[@id='submit-id-sign_up']").click({ force: true })
})

Then("I should see booking submitted page", () => {
    cy.containsText("Booking Completed Successfully")
})


Then(/^I delete the review$/, () => {
    cy.reload()
	cy.contains('Delete').click({force:true})
    cy.get('[class="button-default-dark"]').click()
});
