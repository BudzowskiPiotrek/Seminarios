import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';

class RecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameProvider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("🏆 Record máximo",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text("${game.record}", style: TextStyle(fontSize: 30)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: game.reiniciarRecord,
            child: Text("Reiniciar Record"),
          ),
        ],
      ),
    );
  }
}
