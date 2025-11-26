import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class SimonProvider extends ChangeNotifier {
  List<int> secuencia = [];
  List<int> entradaUsuario = [];
  int ronda = 0;
  bool iniciado = false;
  bool bloqueado = true;
  int activo = -1;

  void iniciarJuego() {
    iniciado = true;
    ronda = 0;
    secuencia.clear();
    nuevaRonda();
    notifyListeners();
  }

  void nuevaRonda() async {
    ronda++;
    entradaUsuario.clear();
    secuencia.add(Random().nextInt(4));
    notifyListeners();
    await reproducirSecuencia();
  }

  Future<void> reproducirSecuencia() async {
    bloqueado = true;

    for (var color in secuencia) {
      await parpadear(color);
      await Future.delayed(Duration(milliseconds: 250));
    }

    bloqueado = false;
    notifyListeners();
  }

  Future<void> parpadear(int index) async {
    activo = index;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 300));

    activo = -1;
    notifyListeners();
  }

  Future<void> pulsarColor(int index, Function(int ronda) onFail) async {
    if (bloqueado) return;

    await parpadear(index);

    entradaUsuario.add(index);

    int pos = entradaUsuario.length - 1;

    if (entradaUsuario[pos] != secuencia[pos]) {
      iniciado = false;
      onFail(ronda);
      return;
    }

    if (entradaUsuario.length == secuencia.length) {
      await Future.delayed(Duration(milliseconds: 300));
      nuevaRonda();
    }

    notifyListeners();
  }
}
