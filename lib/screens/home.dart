import 'package:flutter/material.dart';
import 'package:hello_world/widgets/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
        title: 'Página inicial',
        body: Center(
          child: Text('Bem-vindo ao\nTrilhas PHB!',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ));
  }
}
