# Sobre a API
## Pré-configuração
Para executar a aplicação, você deve ter instalado:
- um versionador da linguagem `ruby`, como o `rbenv` por exemplo.
- Executar o commando `bundle install`, instalando as suas dependências assim que exigidas no terminal.
- Executar no terminal (dentro do diretório `/app/services`) o comando: `ruby key_gen.rb`. Salvar o código impresso no terminal.
- Criar um arquivo `config/master.key` com a resposta da execução do script anterior.
- Estar com o comando `rails s` operante no seu ambiente.
- Verificar se os bancos de dados (tanto development, como test e production) estão listados nas credentials.
- para verificar as credentials, editando-as se pertinente: 
```bash
  EDITOR={{editor de sua preferencia: vi, nano, vim etc}} rails credentials:edit
```

## Endpoints
- Todos os Endpoints estão listados em `config/routes.rb`.

## Execução
`rails s` e já é possível realizar chamadas locais.