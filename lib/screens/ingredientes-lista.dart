import 'package:cozinhando_app/models/ingrediente.dart';
import 'package:cozinhando_app/screens/formulario-ingrediente.dart';
import 'package:cozinhando_app/screens/receita-lista.dart';
import 'package:flutter/material.dart';


class IngredientesLista extends StatefulWidget {
  final List<Ingrediente> _ingredientes = List();

  @override
  State<StatefulWidget> createState() {
    return IngredientesListaState();
  }
}

class IngredientesListaState extends State<IngredientesLista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingredientes'),
      ),
      body: ListView.builder(
        itemBuilder: (context, indice) {
          final ingrediente = widget._ingredientes[indice];
          return ItemIngrediente(ingrediente);
        },
        itemCount: widget._ingredientes.length,
        padding: EdgeInsets.all(8.0),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: 150,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FormularioIngrediente();
                  }),
                ).then((novoIngrediente) => _atualiza(novoIngrediente));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.add),
                  Text('Novo'),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: 150,
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context, ReceitasLista());
                final ingredientes =  widget._ingredientes;
                debugPrint('Ingredientes aqui: $ingredientes');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.check),
                  Text('Confirma'),
                ],
              ),
            ),
          ),
        ],
      ),
      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return FormularioIngrediente();
            }),
          ).then((novoIngrediente) => _atualiza(novoIngrediente));
        },
        label: Text('Novo'),
        icon: Icon(Icons.add),
      ),*/
    );
  }

  void _atualiza(Ingrediente novoIngrediente) {
    if (novoIngrediente != null) {
      setState(() {
        widget._ingredientes.add(novoIngrediente);
      });
    }
  }
}

class ItemIngrediente extends StatelessWidget {
  final Ingrediente _ingrediente;

  ItemIngrediente(this._ingrediente);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_ingrediente.nome),
        subtitle: Text(_ingrediente.precoEmbalagem.toString()),
        trailing: Icon(Icons.more_vert),
        leading: Icon(Icons.fastfood),
      ),
    );
  }
}
