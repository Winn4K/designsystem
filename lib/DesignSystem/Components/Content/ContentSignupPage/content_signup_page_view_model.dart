import 'package:flutter/material.dart';
import '../../../Samples/home_page_sample_screen.dart';

class SignupPageViewModel extends ChangeNotifier {
  String email = '';
  String password = '';
  bool isTermsAccepted = false;
  
  // Função para atualizar o email
  void updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  // Função para atualizar a senha
  void updatePassword(String value) {
    password = value;
    notifyListeners();
  }

  // Função para aceitar os termos
  void toggleTermsAccepted() {
    isTermsAccepted = !isTermsAccepted;
    notifyListeners();
  }

  // Função para validar os dados do formulário
  bool validateForm() {
    if (email.isEmpty || password.isEmpty || !isTermsAccepted) {
      return false;
    }
    return true;
  }

  // Simular uma ação de signup e redirecionar para a Home Page
  Future<void> signup(BuildContext context) async {
    if (validateForm()) {
      // Simular um atraso (pode ser útil em chamadas de API)
      await Future.delayed(Duration(seconds: 1));
      
      // Exibir mensagem de sucesso (opcional)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signup successful!'))
      );

      // Redirecionar para a Home Page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePageSampleScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields correctly.'))
      );
    }
  }
}
