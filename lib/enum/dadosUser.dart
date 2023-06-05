class DadosUser {
  final Map<String, dynamic> _mapa = {
    'nome': null,
    'senha': null,
    'email': null,
    'cep': null,
    'telefone': null,
  };

  String get nome => _mapa['nome'];
  set nome(String value) => _mapa['nome'] = value;

  String get senha => _mapa['senha'];
  set senha(String value) => _mapa['senha'] = value;

  String get email => _mapa['email'];
  set email(String value) => _mapa['email'] = value;

  String get cep => _mapa['cep'];
  set cep(String value) => _mapa['cep'] = value;

  String get telefone => _mapa['telefone'];
  set telefone(String value) => _mapa['telefone'] = value;

  Map<String, dynamic> toMap() {
    return Map<String, dynamic>.from(_mapa);
  }

}

void minhaFuncao(DadosUser objeto) {
  print(objeto.nome);
  print(objeto.senha);
  print(objeto.email);
  print(objeto.cep);
  print(objeto.telefone);

}

void main() {
  DadosUser objeto = DadosUser();
  objeto.nome = 'João';
  objeto.senha = 'senha123';
  objeto.email = 'joao@example.com';
  objeto.cep = '12345-678';
  objeto.telefone = '(12) 3456-7890';

  minhaFuncao(objeto);
}
