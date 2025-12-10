import 'package:flutter/material.dart';
import './dados.dart';
import './lista_perguntas.dart';
import './resultado.dart';


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

  final dados = perguntasRespostas;
  List respostas = [];
  var indicePergunta = 0;
  var totalPontos = 0; 

  @override
  void initState() {
    super.initState();
    perguntasRespostas.shuffle();   
  }

  void responder(String r, int ponto) {
    String p = dados[indicePergunta].pergunta;
    respostas.add({'pergunta': p, 'resposta': r, 'ponto': ponto});
    totalPontos += ponto;          
    indicePergunta++;               
    setState(() {});
  }

  void reiniciar() {
    setState(() {
      indicePergunta = 0;           
      totalPontos = 0;             
      respostas = [];
      perguntasRespostas.shuffle();
    });
  }

  bool get temPergunta {
    return indicePergunta < dados.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mateus Freitas',
          style: TextStyle(fontSize: 30)
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        toolbarHeight: 80,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: temPergunta
          ? ListaPerguntas(
              indicePergunta: indicePergunta,
              perguntas: dados,
              responder: responder,
            )
          : Resultado(respostas, reiniciar, totalPontos),
      ),
    );
  }
}
