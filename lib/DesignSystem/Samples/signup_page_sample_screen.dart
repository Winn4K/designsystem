import 'package:flutter/material.dart';
import '../Components/Content/ContentSignupPage/content_signup_page.dart';
import '../Components/Content/ContentSignupPage/content_signup_page_view_model.dart';

class SignupPageSampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signup Sample',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: SignupPage(),
    );
  }
}
