import 'package:flutter/material.dart';
import './DesignSystem/Samples/footer_home_page_sample_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo de Footer',
      home: FooterHomePageSampleScreen(),
    );
  }
}
