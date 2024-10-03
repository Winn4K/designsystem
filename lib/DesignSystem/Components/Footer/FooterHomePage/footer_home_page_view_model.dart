import 'package:flutter/material.dart';

class FooterHomePageViewModel extends ChangeNotifier {
  List<String> footerItems = ["Label", "Label", "Label", "Profile"];
  int? selectedIndex; // Indica o índice do item selecionado

  void selectItem(int index) {
    selectedIndex = index;
    notifyListeners(); // Notifica os ouvintes sobre a mudança
  }
}
