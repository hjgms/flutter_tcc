import 'package:flutter/material.dart';

import '../enum/dadosUser.dart';

// Funções de tratativa
bool verificarFormatoEmail(String email) {
  String padraoEmail = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';

  RegExp regex = RegExp(padraoEmail);
  return regex.hasMatch(email);
}

bool verificarProvedorEmailValido(String email) {
  List<String> provedoresValidos = [
    'gmail.com',
    'yahoo.com',
    'hotmail.com',
    'outlook.com',
    'aol.com',
    // Adicione outros provedores de email conhecidos conforme necessário
  ];

  String dominio = email.split('@').last.toLowerCase();

  return provedoresValidos.any((provedor) => dominio == provedor);
}

bool verificarEmailValido(String email) {
  if (verificarFormatoEmail(email) && verificarProvedorEmailValido(email)) {
    return true;
  } else {
    return false;
  }
}

bool verificarComplexidadeSenha(String senha) {
  // Verificar se a senha contém pelo menos 1 letra minúscula, 1 letra maiúscula, 1 número e 1 caractere especial
  bool possuiLetraMinuscula = senha.contains(RegExp(r'[a-z]'));
  bool possuiLetraMaiuscula = senha.contains(RegExp(r'[A-Z]'));
  bool possuiNumero = senha.contains(RegExp(r'[0-9]'));
  bool possuiCaractereEspecial =
      senha.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  // Verificar se todos os requisitos são atendidos
  return possuiLetraMinuscula &&
      possuiLetraMaiuscula &&
      possuiNumero &&
      possuiCaractereEspecial;
}

void exibirSnackbar(BuildContext context, String mensagem) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensagem)));
}

String? realizarValidacoes(DadosUser dadosUser, String senhaRepetida) {
  print(verificarFormatoEmail(dadosUser.email));
  if (dadosUser.nome.isEmpty) {
    return 'O nome não pode ser vazio.';
  }
  if (verificarEmailValido(dadosUser.email) != true) {
    return 'O email não tem um formato válido.';
  }
  if (!verificarComplexidadeSenha(dadosUser.senha) ||
      dadosUser.senha.length < 6) {
    return 'A senha está fraca! Ela requer ao menos um caracter especial, um número, uma letra minúscula, uma letra maiúscula e ter 6 caracteres.';
  }
  if (dadosUser.senha != senhaRepetida.trim()) {
    return 'As senhas devem ser iguais.';
  }
  if (dadosUser.telefone.length != 11) {
    return 'O número de telefone deve ter 11 dígitos.';
  }
  if (dadosUser.cep.length != 7) {
    return 'O cep deve ter 7 dígitos.';
  }

  return null; // Retorna null se não houver erros
}
