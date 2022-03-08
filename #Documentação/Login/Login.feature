#language: pt

Cenario: Tela de Login

|  Eu enquanto usuário                       |
|  Quero fazer login com meu usuário e senha |
|  Para ter acesso ao sistema                | 

Dado : [ Critérios ]
| ----------------------------------------------------------------------------------------------------------------------------------|
# Tela deve ser responsiva.
# Input login tipo "string" label Login, validar se foi digitado algum login
# Input senha tipo "string" label Senha, ocultar caracteres digitados
# Button label "Acessar"
# Hyperlink com label "Esqueci minha senha"
# As mensagens de falha na autenticação não devem indicar qual parte dos dados de autenticação está incorreta
# A sessão do usuário deve possuir um tempo de expiração a ser definido pelo administrador do sistema
# Deve existir apenas uma sessão ativa por usuário
| -----------------------------------------------------------------------------------------------------------------------------------|


Cenario: Tela de Login
Dado que o usuário
Quando entrar no link do sistema /login
Então deve carregar a tela de login com os inputs: (Login, Senha) botão: (Entrar)
E opção de (Esqueci minha senha)


Cenario: Login no sistema
Dado que o usuário está na tela de login
Quando se autenticar com usuário
E senha válidos
Então será direcionado para tela inicial do sistema


Cenario: Campos em branco
Dado que o usuário está na tela de login do sistema
Quando se autenticar sem informar login e/ou senha
Então será mostrado a mensagem de erro: 'Obrigatório informar campos Login e Senha'.


Cenário: Esqueceu a senha
Dado que o usuário está na tela de login do sistema
Quando clicar no botão 'Esqueci minha senha'
Então será direcionado para tela de recuperação de senha


Cenario: Login ou senha inválidos
Dado que o usuário esta na tela de login do sistema
Quando Se autenticar com dados inválidos
Então será mostrado a mensagem de erro: 'Login ou senha incorretos'.


Cenário: Visualizar senha em preenchimento
Dado que estou na tela de login do sistema
Quando preencher informações de login e senha
E clicar no ícone de [olho] no canto direito do campo de senha
Então será removida a ocultação dos caracteres digitados
E será mostrada a senha digitada do usuário


Cenário: Lembrar usuário
Dado que estou na tela de login do sistema
Quando preencher informações de login e senha válidos
E marcar o checkbox de [Lembrar usuário]
E clicar no botão login
Então usuário realizará login no sistema
E ficará salvo o usuário para o dispositivo utilizado quando o mesmo retornar a tela de login

Cenário: Bloqueio de Conta
Dado que estou na tela de login do sistema
Quando preencher o login corretamente
E a senha inválida
E clicar em login
E alterar a senha para outra inválida (5x)
E clicar em login (5x)
Então sistema mostra mensagem informando bloqueio de conta [Conta bloqueada. Entre em contato com um administrador.]

Cenário: Usuário com Sessão ativa
Dado que estou na tela de login do sistema
Quando preencher os dados de login e senha corretamente
E clicar em login
Então sistema verifica se o usuário que está conectando possui sessão ativa
E se existir sessão ativa permite usuário decidir se prossegue com a conexão ou não
E ao prosseguir a outra sessão ativa do usuário é finalizada para que o mesmo perca acesso ao sistema
E ao cancelar é apenas finalizada a tentativa de login, e a sessão ativa permanece com acesso normal