import 'package:flutter/material.dart';
import '../Components/Footer/FooterHomePage/footer_home_page.dart';
import '../Components/Footer/FooterHomePage/footer_home_page_view_model.dart';
import 'package:provider/provider.dart';

class FooterHomePageSampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FooterHomePageViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Página de Exemplo com Footer"),
        ),
        body: Center(
          child: Text("Conteúdo da Página Principal"),
        ),
        bottomNavigationBar: Consumer<FooterHomePageViewModel>(
          builder: (context, viewModel, child) {
            return FooterHomePage(viewModel: viewModel);
          },
        ),
      ),
    );
  }
}
