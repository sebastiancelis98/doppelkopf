import 'package:doppelkopf/model/game.dart';
import 'package:doppelkopf/model/gamedata.dart';
import 'package:doppelkopf/pages/game/create_game_page.dart';
import 'package:doppelkopf/pages/game/game_page.dart';
import 'package:doppelkopf/pages/settings/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doppelkopf/services/transitions/transition_utils.dart';
import 'package:provider/src/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameData gameData = context.watch<GameData>();

    SharedPreferences.getInstance().then((prefs) {
      print('Loaded shared prefs');
      if (gameData.games.isEmpty) {
        
        // gameData.addGame(Game(id: 'TestGame', players: {}));
      }
    });

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: gameData.games.length + 1,
              itemBuilder: (context, i) {
                if (i == 0) {
                  return Container();
                }
                Game game = gameData.games.elementAt(i - 1);
                return Card(
                  child: Row(
                    children: [
                      TextButton(
                        child: Text("Game " + i.toString()),
                        onPressed: () {
                          Navigator.of(context).push(
                            slideTransitionBuilder(
                                GamePage(game: game), SlideType.LEFT),
                          );
                        },
                      ),
                      Expanded(child: Container()),
                      IconButton(
                        onPressed: () {
                          gameData.deleteGame(game);
                        },
                        icon: const Icon(Icons.delete),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[300],
        onPressed: () {
          Navigator.push(context,
              slideTransitionBuilder(const CreateGamePage(), SlideType.LEFT));
        },
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
