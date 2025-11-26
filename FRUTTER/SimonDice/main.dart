import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simon_dice/providers/simon_provider.dart';
import 'providers/simon_provider.dart';
import 'views/simon_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SimonProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SimonPage(),
      ),
    ),
  );
}
