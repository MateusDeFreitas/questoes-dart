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
    {
      'pergunta' : 'Qual a sua cor favorita?',
      'respostas': ['rosa','verde','amarelo','azul','vermelho','Cor de burro quando foge'],
    },

    {
      'pergunta' : 'Qual o seu animal favorito?',
      'respostas': ['Gato','Cão','Ave','Porco','Ornitorrinco'],
    },

    {
      'pergunta' : 'Qual é o seu time?',
      'respostas': ['Palmeiras','Corinthians','São Paulo','Santos','Arranca Toco F.C.'],
    },
  ];

  var indicePergunta = 2;

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
              perguntas[indicePergunta]['pergunta'].toString(), 
              style: TextStyle(fontSize: 25)
            ),
            SizedBox(height: 20,), 
            ...((perguntas[indicePergunta]['respostas'] as List<String>)
              .map((textoBotao) => Botoes(resp: responder, txt: textoBotao))
              .toList()),
          ],
        ),
      ),
    );
  }

}
