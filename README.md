# Seja Bem-vindo


## :information_source: Sobre
Projeto feito para aplicação da vaga de Desenvolvedor **Back-End** na **Ruptiva**.

## 🚀 Tecnologias

* Ruby 2.6.6
* Rails 6.1.3.1
* Postgresql 13.2


## :arrow_forward: Como rodar o projeto
```
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ bundle
```
Após estes comandos você possui um usuario **admin** padrão:
```
email: maikel@ruptiva.com
senha: ilikeruptiva
```
## :guardsman: Politicas do sistema
Atualmente existem dois tipos de usuarios no sistema: **user** e **admin**. O **user** pode ver apenas o seu registro e nada mais. O **admin** pode listar todos os usuarios, bem como ver o seu próprio registro.

## :page_with_curl: Como ultilizar:

### Criando um novo usuario
Requisição
```
POST localhost:3000/auth
```
Parâmetros(obrigatorios, exceto: **role**)
```
{
  "first_name": "Arlissn",
  "last_name": "Jaques",
  "email": "arlisson@jaques.com",
  "password": "12345678",
  "role": "admin" # padrão é "user"
}
```
Resposta
```
{
  "status": "success",
  "data": {
    "id": 2,
    "provider": "email",
    "uid": "arlisson@jaques.com",
    "allow_password_change": false,
    "first_name": "Arlisson",
    "last_name": "Jaques",
    "email": "arlisson@jaques.com",
    "role": "admin",
    "created_at": "2021-04-03T06:05:56.195Z",
    "updated_at": "2021-04-03T06:05:56.263Z",
    "deleted_at": null
  }
}
```
### Efetuando login:
Requisição
```
POST localhost:3000/auth/sign_in
```
Parametros(obrigatorios)
```
{
  "email": "arlisson@jaques.com",
  "password": "12345678"
}
```
Resposta
```
{
  "data": {
    "email": "arlisson@jaques.com",
    "uid": "arlisson@jaques.com",
    "id": 2,
    "provider": "email",
    "allow_password_change": false,
    "first_name": "Arlisson",
    "last_name": "Jaques",
    "role": "admin",
    "deleted_at": null
  }
}
```
### Alterando dados

:exclamation: Para qualquer passo adiante você irá precisar de três dados importantes que são: **access-token**, **client**, **uid**. Esses dados te indentificão dentro da aplicação, você os recebe atrávez da resposta do cabeçalho da requisição. E devem ser enviando também no cabeçalho junto da requisição.

Requisição
```
PUT localhost:3000/auth
```
Parâmetros(pelo menos um é necessário)
```
{
  "last_name": "Einstein"
}
```
Resposta
```
{
  "status": "success",
  "data": {
    "last_name": "Einstein",
    "email": "arlisson@jaques.com",
    "uid": "arlisson@jaques.com",
    "id": 2,
    "provider": "email",
    "allow_password_change": false,
    "first_name": "Arlissn",
    "role": "admin",
    "created_at": "2021-04-03T06:38:08.127Z",
    "updated_at": "2021-04-03T06:42:54.774Z",
    "deleted_at": null
  }
}
```
### Alteração de senha:
Requisição
```
PUT localhost:3000/auth/password
```
Parâmetros(obrigatorios)
```
{
  "password": "novasenha",
  "password_confirmation": "novasenha",
  "current_password": "12345678"
}
```
Resposta
```
{
  "success": true,
  "data": {
    "email": "arlisson@jaques.com",
    "uid": "arlisson@jaques.com",
    "id": 2,
    "provider": "email",
    "allow_password_change": false,
    "first_name": "Arlissn",
    "last_name": "Einstein",
    "role": "admin",
    "created_at": "2021-04-03T06:38:08.127Z",
    "updated_at": "2021-04-03T06:51:38.505Z",
    "deleted_at": null
  },
  "message": "Your password has been successfully updated."
}
```
### Sair da sua conta:
Requisição
```
DELETE localhost:3000/auth/sign_out # Não requer parametros
```
Resposta
```
{
  "success": true
}
```
### Apagar uma conta
Requisição
```
DELETE localhost:3000/auth # Não requer parametros
```
Resposta
```
{
  "status": "success",
  "message": "Account with UID 'arlisson@jaques.com' has been destroyed."
}
```
### Acessando registro do usuario atual
Requisição
```
  GET localhost:3000/users/:id_user # Não reuquer parametros
```
Resposta
```
{
  "id": 3,
  "first_name": "Arlisson",
  "last_name": "Jaques",
  "email": "arlisson2@jaques.com",
  "role": "user"
}
```

### Usuario comun tentando obter registro de outro usuario
Requisição
```
GET localhost:3000/users/:id_outro_user # Não reuquer parametros
```
Resposta
```
 {
  "error": {
    "code": 403,
    "message": "Unfortunately you are not authorized to access this feature."
  }
}
```
### Usuario admin obtendo registro de usuario
Requisição
```
GET localhost:3000/users/4 # Não reuquer parametros
```
Resposta
```
{
  "id": 4,
  "first_name": "Albert",
  "last_name": "Einstein",
  "email": "einstein@ciencia.com",
  "role": "user"
}
```
### Usuario admin obtendo registro dos usuarios
Requisição
```
GET localhost:3000/users # Não reuquer parametros
```
Resposta
```
{
  "id": 3,
  "first_name": "Arlisson",
  "last_name": "Jaques",
  "email": "arlisson2@jaques.com",
  "role": "user"
}{
  "id": 4,
  "first_name": "Albert",
  "last_name": "Einstein",
  "email": "einstein@ciencia.com",
  "role": "user"
}
```
