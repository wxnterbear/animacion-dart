import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> _preguntas = [
    '¿Pregunta1?',
    '¿Pregunta2?',
    '¿Pregunta3?',
    '¿Pregunta4?',
    '¿Pregunta5?'
  ];

  int _ipregunta = 0;
  Color _colorboton = Colors.lightBlue;
  Color _ctextopregunta = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Preguntas Aleatorias'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _preguntas[_ipregunta],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, color: _ctextopregunta),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _cambiarPregunta,
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(200, 80)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 25)),
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered)) {
                        return const Color.fromARGB(255, 9, 57, 82);
                      }
                      return _colorboton;
                    },
                  ),
                ),
                child: const Text(
                  'Siguiente pregunta',
                  style: (TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _cambiarPregunta() {
    setState(() {
      final aleatorio = Random();
      _ipregunta = aleatorio.nextInt(_preguntas.length);
      _colorboton = Colors.lightBlueAccent;
      _ctextopregunta = Color.fromRGBO(
        aleatorio.nextInt(256),
        aleatorio.nextInt(256),
        aleatorio.nextInt(256),
        1,
      );
      
    });


  }
  
} 
