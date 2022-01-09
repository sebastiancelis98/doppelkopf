import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doppelkopf"),
      ),
      body: const Center(child: Text("Game data..."),),
    );
  }
}