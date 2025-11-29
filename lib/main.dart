import 'package:flutter/material.dart';
import './botoes.dart';

void main() {
  runApp(const PerguntasApp());
}

class PerguntasApp extends StatelessWidget {
  const PerguntasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home>  {

  final perguntas = [
    'Qual a sua cor favorita?',
    'Qual o seu animal favorito?',
    'Qual é o seu time?',
  ];

  var indicePergunta = 0;

  void responder() {
    if (indicePergunta < perguntas.length - 1) {
      indicePergunta++;
    } else {
      indicePergunta = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mateus Freitas', style: TextStyle(fontSize: 30)),
        centerTitle: true,
        backgroundColor: Colors.amber,
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              perguntas[indicePergunta], 
              style: TextStyle(fontSize: 40)
            ),
            Botoes(resp: responder),
            Botoes(resp: responder),
            Botoes(resp: responder),
          ],
        ),
      ),
    );
  }

}
