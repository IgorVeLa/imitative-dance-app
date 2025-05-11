import 'package:flutter/material.dart';
import 'package:imitative_dance_app/global/widgets/primary_scaffold.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimaryScaffold(),
    );
  }
}
