import 'dart:math';
import 'package:flutter/material.dart';

class LogicaJogo {
  String escolhaUsuario = 'pedra';
  String escolhaApp = 'pedra';
  int pontosUsuario = 0;
  int pontosEmpate = 0;
  int pontosApp = 0;
  Color corBordaUsuario = Colors.transparent;
  Color corBordaApp = Colors.transparent;
  final List<String> escolhas = ['pedra', 'papel', 'tesoura'];

  void jogar(String escolha, Function setStateCallback) {
    escolhaUsuario = escolha;
    escolhaApp = escolhas[Random().nextInt(3)];
    determinarVencedor(setStateCallback);
  }

  void determinarVencedor(Function setStateCallback) {
    setStateCallback(() {
      if (escolhaUsuario == escolhaApp) {
        pontosEmpate++;
        corBordaUsuario = Colors.orange;
        corBordaApp = Colors.orange;
      } else if ((escolhaUsuario == 'pedra' && escolhaApp == 'tesoura') ||
          (escolhaUsuario == 'papel' && escolhaApp == 'pedra') ||
          (escolhaUsuario == 'tesoura' && escolhaApp == 'papel')) {
        pontosUsuario++;
        corBordaUsuario = Colors.green;
        corBordaApp = Colors.transparent;
      } else {
        pontosApp++;
        corBordaUsuario = Colors.transparent;
        corBordaApp = Colors.green;
      }
    });
  }
}
