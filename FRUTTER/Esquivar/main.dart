import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/game_home.dart';
import 'providers/game_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GameProvider(),
      child: MaterialApp(
        home: GameHome(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
