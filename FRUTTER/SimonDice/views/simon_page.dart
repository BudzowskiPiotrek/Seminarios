import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/simon_provider.dart';

class SimonPage extends StatelessWidget {
  void mostrarDialogo(BuildContext context, int ronda) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("¡Perdiste!"),
        content: Text("Ronda alcanzada: $ronda"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          )
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context, int index, Color color) {
    final provider = Provider.of<SimonProvider>(context);

    return GestureDetector(
      onTap: () => provider.pulsarColor(index, (ronda) {
        mostrarDialogo(context, ronda);
      }),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: provider.activo == index ? color.withOpacity(0.4) : color,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SimonProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Simón Dice - Ronda: ${provider.ronda}"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: !provider.iniciado
            ? ElevatedButton(
          onPressed: provider.iniciarJuego,
          child: Text("Comenzar"),
        )
            : AspectRatio(
          aspectRatio: 1,
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(40),
            children: [
              buildButton(context, 0, Colors.red),
              buildButton(context, 1, Colors.blue),
              buildButton(context, 2, Colors.green),
              buildButton(context, 3, Colors.yellow),
            ],
          ),
        ),
      ),
    );
  }
}
