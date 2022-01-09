import 'package:doppelkopf/pages/game/create_game_page.dart';
import 'package:doppelkopf/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:doppelkopf/services/transitions/transition_utils.dart';

class Home extends StatelessWidget{

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doppelkopf"),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(context, slideTransitionBuilder(const Settings(), SlideType.LEFT))
            },
            icon: const Icon(Icons.settings))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              child: FloatingActionButton(
              onPressed: () => {
                Navigator.push(context, slideTransitionBuilder(const CreateGamePage(), SlideType.UP))
              },
              child: const Icon(Icons.add)),
            ),
          ),
        ],
      )
    );
  }
}