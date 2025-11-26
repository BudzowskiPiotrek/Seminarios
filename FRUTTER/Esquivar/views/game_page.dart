import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_provider.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Puntos: ${game.score}", style: TextStyle(fontSize: 22)),
        SizedBox(height: 20),

        // GRID DEL JUEGO
        Column(
          children: List.generate(3, (fila) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (columna) {
                bool esObstaculo =
                    game.obstaculoFila == fila && game.obstaculoPos == columna;
                bool esJugador = fila == 2 && game.jugadorPos == columna;

                return Container(
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.all(6),
                  color: esJugador
                      ? Colors.green
                      : esObstaculo
                      ? Colors.red
                      : Colors.grey[300],
                );
              }),
            );
          }),
        ),

        SizedBox(height: 20),

        // CONTROLES DEL JUGADOR
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: game.moverIzquierda, child: Text("←")),
            SizedBox(width: 20),
            ElevatedButton(onPressed: game.moverDerecha, child: Text("→")),
          ],
        ),

        if (game.gameOver)
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: game.reiniciarJuego,
              child: Text("Reiniciar"),
            ),
          ),
      ],
    );
  }
}
