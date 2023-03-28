import { When, Then, Given } from "@badeball/cypress-cucumber-preprocessor";
import {
    confirmBooking,
    createBooking,
    getB1G1patient2CouponCode,
    getPatient,
    patient2CouponCode
} from "../../../utlis/bookings";
import { DOCTORS, PAGES_PREFIX, DISCOUNTS, PATIENTS } from "../../../utlis/types";
import doctors from '../../../fixtures/doctors.json'

const country = Cypress.env('country');

When("I go to doctor {string} submit booking page", (text) => {
    cy.visit("/bookings/submit_booking/doctor/" + text + "/");
})

When("I go to a normal doctor submit booking page", () => {
    let doctorSlug = doctors[country].normalDoctor.slug
    cy.visit(`/${country}/bookings/submit_booking/doctor/${doctorSlug}/`);
})

When("I go to a walk-in doctor submit booking page", (text) => {
    let doctorSlug = doctors[country].walkInDoctor.slug
    cy.visit(`/${country}/bookings/submit_booking/doctor/${doctorSlug}/`);
})

When(/^I go to a walkin doctor with discount submit booking page$/, () => {
	let doctorSlug = doctors[country].walkInDiscountDoctor.slug
    cy.visit(`/${country}/bookings/submit_booking/doctor/${doctorSlug}/`);
});

When("I go to an instant doctor submit booking page", () => {
    // let doctorSlug = doctors[country].instantDoctor.slug
    let doctorSlug = doctors['qatar'].instantDoctor.slug
    cy.visit(`/bookings/submit_booking/doctor/${doctorSlug}/`);
})

When("I go to a normal doctor with old patients custom price support submit booking page", () => {
    cy.goToPage(PAGES_PREFIX.SUBMIT_BOOKING, DOCTORS.NORMAL_DOCTOR_WITH_OLD_PATIENTS_PRICE_SUPPORT)
})

When("I fill payment form", () => {
    cy.wait(4000)
    cy.get("iframe[name*='__privateStripeFrame']").then(function ($iframe) {
        const $body = $iframe.contents().find('body')
        cy
            .wrap($body)
            .find('input[name="cardnumber"]')
            .type('4242424242424242', { force: true })
        cy
            .wrap($body)
            .find('input[name="exp-date"]')
            .type('03/30', { force: true })
        cy
            .wrap($body)
            .find('input[name="cvc"]')
            .type('737', { force: true })
        cy
            .wrap($body)
            .find('input[autocomplete="postal-code"]')
            .type('12345', { force: true })
    })
})

When("I agree terms and conditions", () => {
    cy.get('[type="checkbox"]').check()
})

Then("I should see payment page", () => {
    cy.url().should('contain', '/payments')
})

When("I go to a video doctor submit booking page", () => {
    let doctorSlug = doctors[country].normalVideoDoctor.slug
    cy.visit(`/${country}/bookings/submit_booking/doctor/${doctorSlug}/`);
})

When(/^I go to a walkin video doctor submit booking page$/, () => {
	let doctorSlug = doctors[country].walkInVideoDoctor.slug
    cy.visit(`/${country}/bookings/submit_booking/doctor/${doctorSlug}/`);
});


When(/^I go to a normal doctor with discount submit booking page$/, () => {
	let doctorSlug = doctors[country].normalDiscountDoctor.slug
    cy.visit(`/${country}/bookings/submit_booking/doctor/${doctorSlug}/`);
});


When("I go to an instant video doctor submit booking page", () => {
    cy.goToPage(PAGES_PREFIX.SUBMIT_BOOKING, DOCTORS.VIDEO_INSTANT_DOCTOR)
})
Then("I should see {string} submit booking page", (text) => {

})

When("I go to B1G1 discount profile page", () => {
    cy.goToPage(PAGES_PREFIX.DISCOUNT_PROFILE, DISCOUNTS.B1G1_NORMAL_DISCOUNT)
})

When("I choose a doctor", () => {
    cy.get('[type="radio"]').first().check()
    cy.contains("Next").click()
})

Then("I should see B1G1 tag", () => {
    cy.contains("Buy1Get1Free")
})

When("I fill in my mobile number", () => {
    let RundomNumber = Math.floor((Math.random() * 899999) + 111111);
    cy.xpath("//*[@placeholder='Enter your mobile number']").type("35" + RundomNumber)
})


When("I fill in my mobile number with used number", () => {
    cy.xpath("//*[@placeholder='Enter your mobile number']").type("97435566123")
})


// When("I fill in PIN", () => {
//     let patient = getPatient(PATIENTS.PATIENT_WITH_PRE_FILLED_INFO)
//     cy.get("[name=pin]").type(patient.Code)
// })

When("I fill in my new user mobile number", () => {
    let patient = getPatient(PATIENTS.NEW_PATIENT)
    cy.getByPlaceholder("Add your Mobile Number").type(patient.phone)
})


When("I fill in a percentage promo code", () => {
    cy.getByPlaceholder("Have a Promocode?").type("TESTCODE1")
    cy.contains("Apply").click()
})

When("I fill in a flat promo code", () => {
    cy.getByPlaceholder("Have a Promocode?").type("TESTCODE2")
    cy.contains("Apply").click()
})

Then("I should see booking submitted page", () => {
    cy.url().should('contain', '/booking-confirmation')
})

When("I fill in patient full name", () => {
    cy.getByPlaceholder("Enter Patient Full Name").clear().type("Test Patient")
})

When("I choose gender", () => {
    cy.get("label").contains('Male').click()
})

When("I choose old patient option", () => {
    cy.get("#oldLabel").click()
})

When("I choose no insurance option", () => {
    cy.get('label[for="noInsuranceButton"]').contains('No').click()
    cy.wait(500)
})


When(/^I choose time slot for the booking$/, () => {
    // if(cy.contains('Show next availability').length > 0) {
    //     cy.contains('Show next availability').click()
    // }
    
	cy.get('[class="time-button available"]').first().click()
});


Then("I should see doctor walk-in schedule", () => {

})

Then("I should see doctor instant schedule", () => {

})

When("I choose a timeslot", () => {
    cy.containsText('PM|AM').first().click()
})

When("I click on submit payment button", () => {
    cy.containsText('Submit Payment Information|Pay').click()
})

When("I go to B1G1 discount profile as patient 2", () => {
    cy.get('@setupData').then(function (data) {
        cy.visit(`/discount/signature-hydrafacial?coupon_code=${data.coupon_code}`)
    })

})
Given("Patient 1 submitted a B1G1 code", () => {
})

When("I click on Submit Booking", () => {
    cy.wait(2000)
    cy.get("[class*=booking-submit]").click({ force: true })
})

When("I click on Next", (Text) => {
    cy.xpath("//*[@id='submit-id-sign_up']").click({ force: true })
})

When("I click on Verify My Mobile Number", (Text) => {
    cy.xpath("//*[@id='submit-id-sign_up']").click({ force: true })
})

When("I click on Booking now", (Text) => {
    cy.xpath("//*[@class='button-default-md book-now next-available']").click({ force: true })
})


Then(/^I should see my appointments page$/, () => {
    cy.url().should('contain', 'me/appointments')
});

Then(/^I should see the new booking$/, () => {
    cy.get('[class=single-appointment]').first()
        .should('contain', 'Paid')
        .should('contain', 'Video Visit')
});

// When("I fill payment form", () => {
//     cy.get('[name="cardnumber"]').type('4242424242424242')
//     cy.get('[name="exp-date"]').type('0330')
//     cy.get('[name="cvc"]').type('737')
// })


When(/^I click on Clinic Visit$/, () => {
	cy.get('[class="booking-type-details"]').contains('Clinic Visit').click()
});

When(/^I click on Video Visit$/, () => {
	cy.get('[class="booking-type-details"]').contains('Video Visit').click()
});