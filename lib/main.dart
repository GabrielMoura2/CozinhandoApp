

import 'package:cozinhando_app/screens/receita-lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(CozinhandoApp());

class CozinhandoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReceitasLista(),
      theme: ThemeData(
        primaryColor: Colors.lightGreenAccent[100],
        accentColor: Colors.deepOrangeAccent[200],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepOrangeAccent[200],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    );
  }
}
