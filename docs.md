# ***Documentation for Project***

----

## declaração de varíaveis

   - seguir o padrão de criar variáveis com apenas a segunda palavra com a primeira letra em maiúsculo.

   - seguir também os padões de identação e espaçamento ao criar as variávies.

### exemplo:
    String nomeDaVariavel = "nome";

----

## declaração de funções fora do widget

   - sempre utilizar espaços e organização na declaração das mesmas.

   - ultilizar nomes com o padrão apenas a segunda palavra com a primeira letra em maiúsculo.

   - caso tenha retorno inclua a tipagem dele atrás de seu nome.

### exemplos:
    String pegaTexto() {
        return "Texto";
    }

#### or
    void limpaTexto() {
        //desenho sem retorno
    }

----

## declaração de funções dentro do widget

   - seguir os mesmos padrões das funções fora com apenas uma exeção, caso retorne algo ao widget
   em expecifico, colocar tipagem, caso não, apenas declarar dynamic.

### exemplos:

    String pegaTexto() {
        return "Texto";
    }

#### or
    limpaTexto() {
        //sem retorno
    }

----
