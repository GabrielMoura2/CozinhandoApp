import 'package:cozinhando_app/screens/ingredientes-lista.dart';
import 'package:flutter/material.dart';



class ReceitasLista extends StatefulWidget {
  @override
  _ReceitasListaState createState() => _ReceitasListaState();
}

const String _titulo = 'Receita 1';
const double _valor = 20.00;

class _ReceitasListaState extends State<ReceitasLista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_titulo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Container(
                height: 200,
                margin: EdgeInsets.all(6),
                child: ListTile(
                  title: Text('Bla'),
                  subtitle: Text('Bla2'),
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Container(
                height: 200,
                margin: EdgeInsets.all(6),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Container(
                height: 100,
                margin: EdgeInsets.all(6),
                alignment: AlignmentDirectional.center,
                child: Text(
                  'O total é de: R\u0024$_valor',
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IngredientesLista(),
            ),
          );
        },
      ),
    );
  }
}
