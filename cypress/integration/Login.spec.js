import login from '../pages/LoginPage'
describe('Login', function () {

    beforeEach(function(){
        cy.fixture('loginUser').then((u) => {
            this.loginUser = u
        })
    });

    context('Testes em Login', function () {
        
        it('Login Sucesso', function(){
            login.go()
            login.preencherLogin(this.loginUser.valido)
            login.subimit()
        });

        it('Login Email Incorreto', function(){
            login.go()
            login.preencherLogin(this.loginUser.invalido)
            login.subimit()
        });
    })
})