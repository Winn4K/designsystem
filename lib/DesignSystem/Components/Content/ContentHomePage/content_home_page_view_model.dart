import 'package:flutter/material.dart';

class ContentHomePageViewModel extends ChangeNotifier {
  String _name;
  String _email;
  String _imageUrl;

  ContentHomePageViewModel({
    required String name,
    required String email,
    required String imageUrl,
  })  : _name = name,
        _email = email,
        _imageUrl = imageUrl;

  // Getters para o nome, email e imagem
  String get name => _name;
  String get email => _email;
  String get imageUrl => _imageUrl;

  // Método para atualizar o nome
  void updateName(String newName) {
    _name = newName;
    notifyListeners(); // Notifica a UI para atualizar
  }

  // Dados de exemplo
  static ContentHomePageViewModel example() {
    return ContentHomePageViewModel(
      name: 'Amanda Doe',
      email: 'amanda@gmail.com',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/4042/4042356.png', // URL da imagem
    );
  }
}
