class Ingrediente {
  final double precoEmbalagem;
  final String nome;
  final double volumeEmbalagem;
  final double quantidadeUsada;

  Ingrediente(
    this.nome,
    this.precoEmbalagem,
    this.volumeEmbalagem,
    this.quantidadeUsada,
  );

  @override
  String toString() {
    return 'Ingrediente{valorEmbalagem: $precoEmbalagem , nome: $nome, volumeEmbalagem: $volumeEmbalagem, quantidadeUsada: $quantidadeUsada}';
  }
}
