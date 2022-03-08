class LoginPage {
    go() {
        cy.visit('/')
    }
    preencherLogin(loginUser) {
        cy.get('#username').type(loginUser.email)
        cy.get('#password').type(loginUser.pass)
    }
    subimit() {
        cy.get('button[type=submit]').click()
        cy.contains('button','Confirmar').click()
    }
} export default new LoginPage;
