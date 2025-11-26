import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameProvider extends ChangeNotifier {
  // Estado del juego
  int jugadorPos = 1;
  int obstaculoPos = Random().nextInt(3);
  int obstaculoFila = 0;
  int score = 0;
  int record = 0;
  bool gameOver = false;

  // Timer & velocidad
  Timer? gameTimer;
  int velocidad = 700;

  GameProvider() {
    cargarRecord();
    iniciarMovimiento();
  }

  // -------------------------------
  // RECORD
  // -------------------------------
  Future<void> cargarRecord() async {
    final prefs = await SharedPreferences.getInstance();
    record = prefs.getInt('record_maximo') ?? 0;
    notifyListeners();
  }

  Future<void> guardarRecord() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('record_maximo', record);
  }

  // -------------------------------
  // MOVIMIENTO DEL JUEGO
  // -------------------------------
  void iniciarMovimiento() {
    gameTimer?.cancel();
    gameTimer = Timer.periodic(Duration(milliseconds: velocidad), (timer) {
      if (!gameOver) _actualizarObstaculo();
    });
  }

  void _actualizarObstaculo() {
    if (obstaculoFila < 2) {
      obstaculoFila++;
    } else {
      if (obstaculoPos == jugadorPos) {
        // Golpe
        gameOver = true;
        if (score > record) {
          record = score;
          guardarRecord();
        }
        gameTimer?.cancel();
      } else {
        // Superado
        score++;
        obstaculoPos = Random().nextInt(3);
        obstaculoFila = 0;

        // Aumentar dificultad
        if (score % 5 == 0 && velocidad > 200) {
          velocidad -= 100;
          iniciarMovimiento();
        }
      }
    }
    notifyListeners();
  }

  // -------------------------------
  // MOVIMIENTO DEL JUGADOR
  // -------------------------------
  void moverIzquierda() {
    if (jugadorPos > 0) {
      jugadorPos--;
      notifyListeners();
    }
  }

  void moverDerecha() {
    if (jugadorPos < 2) {
      jugadorPos++;
      notifyListeners();
    }
  }

  // -------------------------------
  // REINICIAR JUEGO
  // -------------------------------
  void reiniciarJuego() {
    if (score > record) {
      record = score;
      guardarRecord();
    }

    score = 0;
    gameOver = false;
    jugadorPos = 1;
    obstaculoPos = Random().nextInt(3);
    obstaculoFila = 0;
    velocidad = 700;

    iniciarMovimiento();
    notifyListeners();
  }

  // -------------------------------
  // REINICIAR RECORD
  // -------------------------------
  void reiniciarRecord() {
    record = 0;
    guardarRecord();
    notifyListeners();
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    super.dispose();
  }
}
