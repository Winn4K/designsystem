import 'package:flutter/material.dart';
import 'DesignSystem/Samples/home_page_sample_screen.dart';
import 'DesignSystem/Samples/signup_page_sample_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup',
      home: SignupPageSampleScreen(),
    );
  }
}
