import 'package:flutter/material.dart';
import '../Components/Footer/FooterHomePage/footer_home_page.dart';
import '../Components/Footer/FooterHomePage/footer_home_page_view_model.dart';
import '../Components/Content/ContentHomePage/content_home_page.dart';
import '../Components/Content/ContentHomePage/content_home_page_view_model.dart';
import 'package:provider/provider.dart';

class HomePageSampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ContentHomePageViewModel.example()),
        ChangeNotifierProvider(create: (context) => FooterHomePageViewModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 60.0, bottom: 40.0), // Adiciona padding superior
            child: Text(
              "Profile",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Center(
          child: Consumer<ContentHomePageViewModel>(
            builder: (context, viewModel, child) {
              return ContentHomePage(viewModel: viewModel); // Agora pode acessar o ViewModel
            },
          ),
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
