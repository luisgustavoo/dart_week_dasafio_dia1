import 'dart:convert';

class Menu {
  Menu({this.id, this.nome, this.preco});

  final int id;
  final String nome;
  final double preco;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
    };
  }

  factory Menu.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Menu(
      id: map['id'],
      nome: map['nome'],
      preco: map['preco'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Menu.fromJson(String source) => Menu.fromMap(json.decode(source));
}
