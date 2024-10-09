import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'content_home_page_view_model.dart';
import '../ContentSignupPage/content_signup_page.dart'; // Altere para o caminho correto do seu arquivo


class ContentHomePage extends StatelessWidget {
  final ContentHomePageViewModel viewModel;

  ContentHomePage({required this.viewModel});

  // Método para mostrar o diálogo de edição do nome
  void _showEditNameDialog(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    _controller.text = viewModel.name;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Name'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: "Enter new name"),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                // Atualiza o nome no ViewModel
                viewModel.updateName(_controller.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ContentHomePageViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar, nome e email
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(viewModel.imageUrl),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewModel.name,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        viewModel.email,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32),

              // Edit Name
              ListTile(
                title: Text('Edit Name'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  _showEditNameDialog(
                      context); // Exibe o diálogo para editar o nome
                },
              ),
              Divider(),

              // Shipping Info
              ListTile(
                title: Text('Shipping Info'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Ação ao clicar
                },
              ),
              Divider(),

              // Notification
              ListTile(
                title: Text('Notification'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Ação ao clicar
                },
              ),
              Divider(),

              // Terms & Condition
              ListTile(
                title: Text('Terms & Condition'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Ação ao clicar
                },
              ),
              Divider(),

              // Logout
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SignupPage()), // Navega para a SignupPage
                    );
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
