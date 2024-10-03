import 'package:flutter/material.dart';
import 'footer_home_page_view_model.dart';

class FooterHomePage extends StatelessWidget {
  final FooterHomePageViewModel viewModel;

  FooterHomePage({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      height: 100,
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: viewModel.footerItems.asMap().entries.map((entry) {
          int index = entry.key;
          String item = entry.value;

          bool isSelected = viewModel.selectedIndex == index;

          return GestureDetector(
            onTap: () {
              viewModel.selectItem(index); // Atualiza o índice selecionado
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isSelected ? const Color.fromARGB(255, 251, 255, 0) : const Color.fromARGB(255, 0, 0, 0), // Cor baseada na seleção
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  item,
                  style: TextStyle(color: isSelected ? const Color.fromARGB(255, 251, 255, 0) : const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
