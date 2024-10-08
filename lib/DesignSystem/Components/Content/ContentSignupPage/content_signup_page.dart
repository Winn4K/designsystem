import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'content_signup_page_view_model.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Variável para controlar o estado de obscureText
  bool _obscureText = true;

  // Alterna a visibilidade da senha
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupPageViewModel(),
      child: Consumer<SignupPageViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Placeholder para imagem de perfil (por enquanto, uma caixa cinza)
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.person, size: 50, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 30),

                  // Campo de email
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 10.0), // Altera a altura
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) => viewModel.updateEmail(value),
                  ),
                  SizedBox(height: 20),

                  // Campo de senha com ícone de visibilidade
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 10.0), // Altera a altura
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Alterna o ícone de visibilidade
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordVisibility, // Chama a função ao pressionar
                      ),
                    ),
                    obscureText: _obscureText, // Controla a visibilidade do texto
                    onChanged: (value) => viewModel.updatePassword(value),
                  ),
                  SizedBox(height: 20),

                  // Checkbox para aceitar termos
                  Row(
                    children: [
                      Checkbox(
                        value: viewModel.isTermsAccepted,
                        onChanged: (value) => viewModel.toggleTermsAccepted(),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navegar para termos e serviços se necessário
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('I have read and agree to'),
                            TextButton(
                              onPressed: () {
                                // Navegar para terms & services
                              },
                              child: Text(
                                'Terms & Services',
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 17, 0, 255)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Botão de Signup
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700], // Cor de fundo amarela
                      foregroundColor: Colors.black, // Cor do texto no botão
                      minimumSize: Size(double.infinity, 50), // Largura máxima
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Borda arredondada
                      ),
                    ),
                    onPressed: () {
                      viewModel.signup(context);
                    },
                    child: Text('Signup', style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 20),

                  // Texto "Already Have An Account?"
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0), // Adiciona um padding superior de 20 pixels
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already Have An Account?'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Botão de Login
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700], // Cor de fundo amarela
                      foregroundColor: Colors.black, // Cor do texto no botão
                      minimumSize: Size(100, 40), // Largura máxima
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Borda arredondada
                      ),
                    ),
                    onPressed: () {
                      viewModel.signup(context);
                    },
                    child: Text('Login', style: TextStyle(fontSize: 12)),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
