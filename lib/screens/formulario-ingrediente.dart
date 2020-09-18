import 'package:cozinhando_app/components/editor.dart';
import 'package:cozinhando_app/models/ingrediente.dart';
import 'package:flutter/material.dart';

class FormularioIngrediente extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormularioIngredienteState();
}

class FormularioIngredienteState extends State<FormularioIngrediente> {
  final TextEditingController _controladorCampoProduto =
      TextEditingController();
  final TextEditingController _controladorCampoPrecoEmbalagem =
      TextEditingController();
  final TextEditingController _controladorCampoVolumeEmbalagem =
      TextEditingController();
  final TextEditingController _controladorCampoQuantidadeUsada =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Ingrediente'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoProduto,
              rotulo: 'Produto',
              teclado: TextInputType.text,
              dica: 'Leite',
            ),
            //Produto
            Editor(
              controlador: _controladorCampoPrecoEmbalagem,
              rotulo: 'Preço da Embalagem',
              teclado: TextInputType.number,
              dica: '3.50',
            ),
            //Preço da Embalagem
            Editor(
              controlador: _controladorCampoVolumeEmbalagem,
              rotulo: 'Volume da Embalagem',
              dica: 'kg, mL, L...',
              teclado: TextInputType.number,
            ),
            //Volume da Embalagem
            Editor(
              controlador: _controladorCampoQuantidadeUsada,
              rotulo: 'Quantidade Usada na Receita',
              dica: 'kg, mL, L...',
              teclado: TextInputType.number,
            ),
            //Qtd Usada na Receita
          ],
        ),
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 130,
            child: FloatingActionButton.extended(
              onPressed: () {
                _criarIngrediente(context);
              },
              label: Text('Confirmar'),
            ),
          ),
        ],
      ),
    );
  }

  void _criarIngrediente(context) {
    final String produto = _controladorCampoProduto.text;
    final double precoEmbalagem =
        double.tryParse(_controladorCampoPrecoEmbalagem.text);
    final double volumeEmbalagem =
        double.tryParse(_controladorCampoVolumeEmbalagem.text);
    final double quantidadeUsada =
        double.tryParse(_controladorCampoQuantidadeUsada.text);

    if (produto != null &&
        precoEmbalagem != null &&
        volumeEmbalagem != null &&
        quantidadeUsada != null) {
      if (precoEmbalagem > 0.0 &&
          volumeEmbalagem > 0.0 &&
          quantidadeUsada > 0.0) {
        final criouIngrediente = Ingrediente(
            produto, precoEmbalagem, volumeEmbalagem, quantidadeUsada);
        Navigator.pop(context, criouIngrediente);
        debugPrint('$criouIngrediente');
      }
    }
  }
}
