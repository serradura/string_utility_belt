#  0.4.0
## Summary: New dependency
* Adicionado <a href="https://github.com/serradura/stringub-commons">stringub-commons</a> como dependência do projeto.
  - Adicionam os métodos words e unique_spaces (que entrou no lugar do simple_space).
* Testes foram refatorados fazendo com que suas dependências fossem isoladas.

#  0.3.3
## Summary: Docs
* Criado change log para listar as principais alterações entre cada versão.
* Criado ROADMAP para informar os planos para a gem.
* Adicionado warnings para alertar quais métodos que estarão depreciados na próxima versão, abaixo está a listagem dos  métodos que serão depreciados:
  - simple_space
  - simple_space!
  - regex_me_to_search_ruby
  - regex_me_to_search_mysql
  - have_this_words
  - not_have_this_words?
  - total_frequency_by
  - words_frequency_by
  - match_and_score_by
  - decode_entities_and_cleaner

#  0.3.2
## Summary: Refactory
* Finalizada a refatoração do módulo RegexMe transformando em uma lib a parte (No futuro será uma Gem independente).

#  0.3.1
## Summary: Bug Fix
* Incluido a gem htmlentities (4.3.0) como dependencia de runtime ao gemspc
para instala-lá juntamente com o string_utility_belt

#  0.3.0
## Summary: Refactory
* Todos os módulos foram refatorados
* Também foram criada classes internas para encapsular a lógica nas libs General e MatchRank (Começarm planos para  serem uma gem a parte).

#  0.2.5
## Summary: Test coverage
* 100% de cobertura de teste
* E pequenas refatorações foram feitas ao longo do processo. 

#  <= 0.2.5
## Summary: Self learning
* Minha intenção foi a de começar com open-source compartilhando bibliotecas que foram úteis para mim.
* 0% de cobertura de testes... (#fail) 
* O código era muito ruim mas funcionava. :P
