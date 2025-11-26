import 'package:flutter/material.dart';
import 'game_page.dart';
import 'record_page.dart';

class GameHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          GamePage(),
          RecordPage(),
        ],
      ),
    );
  }
}
