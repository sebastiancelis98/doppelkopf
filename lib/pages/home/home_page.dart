import 'package:doppelkopf/model/game.dart';
import 'package:doppelkopf/model/gamedata.dart';
import 'package:doppelkopf/pages/game/create_game_page.dart';
import 'package:doppelkopf/pages/game/game_page.dart';
import 'package:doppelkopf/pages/settings/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doppelkopf/services/transitions/transition_utils.dart';
import 'package:provider/src/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameData gameData = context.watch<GameData>();
    gameData.loadGameData();

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
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(
                          slideTransitionBuilder(
                              GamePage(game: game), SlideType.LEFT),
                        )
                        .then((value) => gameData.saveGameData());
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Center(
                          child: Text(game.getAbbreviatedFormattedDate()),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: game.players.map((e) {
                                      return Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text(e.name),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(e.points.toString())
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                gameData.deleteGame(game);
                              },
                              icon: const Icon(Icons.delete),
                            )
                          ],
                        ),
                      ],
                    ),
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
