import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";


Then(/^I should be redirected to Terms of service page$/, () => {
    cy.url().should('include', '/terms/')
    cy.contains('Terms of Service').should('be.visible')
});


Then(/^I should be able to navigate to different page sections using the table of contents$/, () => {
    cy.get('ul[id="sidebar"] li').each(($el, index, $list) => {
        let text = $el.text()
        text = text.toLowerCase().trim().replaceAll(' ', '-')
            .replaceAll('we-don\'t', 'do-not')
            .replaceAll('-or-submit', '')
            .replaceAll('use', 'user')
        cy.wrap($el).click()
        cy.url().should('include', `#${text}`)
    });
});


Then(/^I should be redirected to Privacy Policy page$/, () => {
    cy.url().should('include', '/privacy/')
    cy.contains('Privacy Policy').should('be.visible')
});
