import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const GameApp());
}

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  final estilo = const TextStyle(color: Colors.white, fontSize: 32);

  String status = '';

  void play(String option) { //Recebe um valor do usuario 

    List<String> options = ['Pedra', 'Papel', 'Tesoura']; // Lista de escolhas da maquina
    int computerChoiceIndex = Random().nextInt(3); // A escolha aleatoria, pelo Index da lista de escolhas [0 a 2]
    String computerChoice = options[computerChoiceIndex]; // O retorno da escolha é passado para esta variavel

    //Logica do jogo
    if (option == computerChoice) { //Se as variaveis do usuario e da maquina forem iguais, então empate
      setState(
          () => status = 'Empate! Você e o computador escolheram $option.');
    } else if ((option == 'Pedra' && computerChoice == 'Tesoura') ||
        (option == 'Tesoura' && computerChoice == 'Papel') ||
        (option == 'Papel' && computerChoice == 'Pedra')) { // se as opções do jogador forem melhores do que o da maquina, então vitoria
      setState(
          () => status = 'Você ganhou! O computador escolheu $computerChoice.');
    } else { //Qualquer coisa diferente, então derrota
      setState(
          () => status = 'Você perdeu! O computador escolheu $computerChoice.');
    }
  }

  @override
  build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text(status),
            Expanded(
              child: GestureDetector(
                onTap: () => play('Pedra'),
                child: Container(
                  color: Colors.red,
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Center(
                    child: Text('Pedra', style: estilo),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => play('Papel'),
                child: Container(
                  color: Colors.blue,
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Center(
                    child: Text('Papel', style: estilo),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => play('Tesoura'),
                child: Container(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  child: Center(
                    child: Text('Tesoura', style: estilo),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
