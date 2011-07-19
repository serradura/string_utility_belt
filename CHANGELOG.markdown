#  0.3.3
## Summary: Docs
* Criado change log para listar as principais alterações entre cada versão.
* Criado ROADMAP para informar os planos para a gem.
* Adicionado warnings para alertar quais métodos que estarão depreciados na próxima versão, abaix está a listagem deles:
  StringUtilityBelt::RegexMe::Builders.regex_me_to_search_ruby will be deprecated in the next_version
  StringUtilityBelt::RegexMe::Builders.regex_me_to_search_mysql will be deprecated in the next_version
  StringUtilityBelt::General.have_this_words? will be deprecated in the next_version
  StringUtilityBelt::General.not_have_this_words? will be deprecated in the next_version
  StringUtilityBelt::MatchRank.total_frequency_by will be deprecated in the next_version
  StringUtilityBelt::MatchRank.words_frequency_by will be deprecated in the next_version
  StringUtilityBelt::MatchRank.match_and_score_by will be deprecated in the next_version
  StringUtilityBelt::Entities.decode_entities_and_cleaner will be deprecated in the next_version

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

#  > 0.2.5
## Summary: Test coverage
* 100% de cobertura de teste
* E pequenas refatorações foram feitas ao longo do processo. 

#  <= 0.2.5
## Summary: Self learning
* Minha intenção foi a de começar com open-source compartilhando bibliotecas que foram úteis para mim.
* 0% de cobertura de testes... (#fail) 
* O código era muito ruim mas funcionava. :P
