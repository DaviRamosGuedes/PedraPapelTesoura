import 'package:flutter/material.dart';
import 'logica_jogo.dart';

void main() {
  runApp(const JogoPedraPapelTesoura());
}

class JogoPedraPapelTesoura extends StatelessWidget {
  const JogoPedraPapelTesoura({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedra, Papel, Tesoura',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TelaJogo(),
    );
  }
}

class TelaJogo extends StatefulWidget {
  const TelaJogo({super.key});

  @override
  _TelaJogoState createState() => _TelaJogoState();
}

class _TelaJogoState extends State<TelaJogo> {
  final LogicaJogo logicaJogo = LogicaJogo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pedra, Papel, Tesoura')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Disputa',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: logicaJogo.corBordaUsuario,
                    width: 3,
                  ),
                ),
                child: Image.asset(
                  'imagens/${logicaJogo.escolhaUsuario}.png',
                  width: 100,
                  height: 100,
                ),
              ),
              const Text('vs', style: TextStyle(fontSize: 20)),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: logicaJogo.corBordaApp, width: 3),
                ),
                child: Image.asset(
                  'imagens/${logicaJogo.escolhaApp}.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ],
          ),
          const Text(
            'Placar',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text('Você', style: TextStyle(fontSize: 18)),
                  Text(
                    '${logicaJogo.pontosUsuario}',
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('Empate', style: TextStyle(fontSize: 18)),
                  Text(
                    '${logicaJogo.pontosEmpate}',
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('Máquina', style: TextStyle(fontSize: 18)),
                  Text(
                    '${logicaJogo.pontosApp}',
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ],
          ),
          const Text(
            'Opções',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => logicaJogo.jogar('pedra', setState),
                child: Image.asset('imagens/pedra.png', width: 80, height: 80),
              ),
              GestureDetector(
                onTap: () => logicaJogo.jogar('papel', setState),
                child: Image.asset('imagens/papel.png', width: 80, height: 80),
              ),
              GestureDetector(
                onTap: () => logicaJogo.jogar('tesoura', setState),
                child: Image.asset(
                  'imagens/tesoura.png',
                  width: 80,
                  height: 80,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
