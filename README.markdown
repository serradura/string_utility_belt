# serradura-string_utility_belt

## Links

<a href='http://rubygems.org/gems/string_utility_belt'>http://rubygems.org/gems/string_utility_belt</a>

<a href="http://github.com/serradura/string_utility_belt">http://github.com/serradura/string_utility_belt</a>

## Motivação
Em meus primeiros projetos em Ruby criei algumas bibliotecas para trabalhar com strings. Como estava começando com a linguagem comecei a explorar o ecossistema e então resolvi criar a minha primeira rubygem. Minha intenção foi a de aprender e compartilhar.

## Install

    gem install string_utility_belt

## Let's code!

Pessoal,
Peguei um amontoado de métodos que andei desenvolvendo para strings e surgiu essa gem!

Dentre alguns dos módulos que ela tem é o módulo que transforma a String em uma Regex, o nome do módulo é RegexMe! :p

Segue alguns exemplos:

    >> require "string_utility_belt"
    >> "coca cola".regex_me_to_search_ruby
    => /(coca|cola)/

Qual a utilidade disso???

Imagine que você tem a seguinte coleção:

    minha_colecao = %w{carro caminhão moto lancha avião banana bonono benene}

E você que selecionar as palavras que contenha: car e mo

     minha_colecao.select { |item| item =~ "car mo".regex_me_to_search_ruby }
     #=> ["carro", "moto"]

Mas e se você quiser as palavras que termine com a letra "a" e que case com b*n*n*
 
     minha_colecao.select { |item| item =~ "*a b*n*n*".regex_me_to_search_ruby }
     #=> ["lancha", "banana", "bonono", "benene"]

Vamos tentar só com o que termina com a letra "a"
 
     minha_colecao.select { |item| item =~ "*a".regex_me_to_search_ruby }
     #=> ["lancha", "banana"]

Que comece com a letra "m"

     minha_colecao.select { |item| item =~ "m*".regex_me_to_search_ruby }
     #=> ["moto"]

Uaaaaauuuu, entenderam as possibilidades?
Você também pode fazer:

     minha_colecao.select { |item| item =~ "m* car *a b*n*".regex_me_to_search_ruby }
     #=> ["carro", "moto", "lancha", "banana", "bonono", "benene"]

Você também pode passar alguns parametros para criar Regex mais inteligentes:

Regexs que ignoram case sensitive

      minha_colecao.select { |item| item =~ "N".regex_me_to_search_ruby(:case_insensitive => true) }
      #=> ["caminhão", "lancha", "banana", "bonono", "benene"]

Que case palavras exatas idependente se é maiuscula ou minuscula

      ["Ruby Rails", "Ruby on Rails", "Ruby - Rails"].select { |item| item =~ "ruby rails".regex_me_to_search_ruby(:case_insensitive => true, :exact_phrase => true) }
      #=> ["Ruby Rails", "Ruby - Rails"]

O parâmetro :exact_phrase ignora qualquer caracter do tipo
letra (maiúscula ou minúscula) e números além do char "_"
me basei na regra utilizada pelo twitter e google quando usamos "

Ex: "Ruby Rails"

Que tenha palavras exatas
       
      minha_colecao.select { |item| item =~ "car".regex_me_to_search_ruby(:exact_word => true) } 
      #=> []

Se eu quiser que palavras que contenham car

      minha_colecao.select { |item| item =~ "car".regex_me_to_search_ruby }
      #=> ["carro"]

Agora vamos supor que o usuário queira casar a palavra estágio
mas nos textos que ele estava buscando a palavra ele percebeu que existia palavra com e sem acentuação

      palavras = %w{estagio estágio éstágio estagió estagios}

      palavras.select { |palavra| palavra =~ "estágio".regex_me_to_search_ruby }
      #=> ["estágio"]

E agora e se eu quiser casar as palavras independente da acentuação???

      palavras.select { |palavra| palavra =~ "estágio".regex_me_to_search_ruby(:latin_chars_variation => true)}
      #=> ["estagio", "estágio", "éstágio", "estagió", "estagios"]

Mas se eu quiser apenas estágio, e ignorar estagios por exemplo???

      palavras.select { |palavra| palavra =~ "estágio".regex_me_to_search_ruby(:latin_chars_variation => true, :exact_word => true)}
      #=> ["estagio", "estágio", "éstágio", "estagió"]


Mas saindo um pouco do ruby e pensando numa aplicação em rails.
Imagine que você tem um campo de busca e o usuário pode escrever várias palavras no campo (Igual ao google) e o resultado deverá retornar as palavras que contenham o que o usário digitou.

Imagine que você tá no controller (Embora essa lógica deveria estar no model! :D)

       @textos = Texto.all(:conditions => ["texto REGEXP ?", params[:busca].regex_me_to_search_mysql])

Por enquanto as regex estão prontas para o mysql e você pode utilizar todos os parâmetros que foram apresentados acima!

Perceberam os ganho que tivemos na aplicação???

O usuário pode escrever no form:

       car* *a c*r*

Só com isso você já da o poder do usuário fazer pesquisas mais inteligentes e você só utiliza um método!

Não sei se devo.... Mas muitos programadores fazem buscas dinâmicas utilizando o operador LIKE e sai essas bizarrices.

        SELECT * FROM TEXTOS
        WHERE texto LIKE "%CARRO%"
        OR texto LIKE "%MOTO%"
        OR texto LIKE "%AVIAO%"

Já com o <b>string_utility_belt</b> ele vai gerar.

      SELECT * FROM TEXTOS WHERE texto REGEXP "(CARRO|MOTO|AVIAO)"

Que é muito mais inteligente e poderoso!!!

É isso!!!

A api tem outras funcionalidades bem interessantes...
Mas para começar vou documentar apenas o módulo RegexMe!

E caso você queira colaborar...
Dê um fork no projeto envie seus códigos e publicarei na GEM.

Abraço,
Serradura
  
