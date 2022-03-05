import 'package:doppelkopf/pages/game/create_game_page.dart';
import 'package:doppelkopf/pages/settings/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doppelkopf/services/transitions/transition_utils.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Doppelkopf",
            style: TextStyle(color: Colors.black87, fontSize: 22),
          ),
          actions: [
            IconButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          slideTransitionBuilder(
                              const Settings(), SlideType.LEFT))
                    },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black87,
                  size: 22,
                ))
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
                          Navigator.push(
                              context,
                              slideTransitionBuilder(
                                  const CreateGamePage(), SlideType.LEFT))
                        },
                    child: const Icon(CupertinoIcons.add)),
              ),
            ),
          ],
        ));
  }
}
