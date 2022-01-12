import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  final Set<String> playerNames;

  const GamePage({Key? key, required this.playerNames}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> playerCards = playerNames
        .map((playerName) => PlayerCard(
              playerName: playerName,
            ))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doppelkopf"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: playerCards,
      ),
    );
  }
}

class PlayerCard extends StatefulWidget {
  final String playerName;

  const PlayerCard({Key? key, required this.playerName}) : super(key: key);

  @override
  _PlayerCardState createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  int points = 0;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Card(
      child: SizedBox(
        height: deviceHeight / 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.playerName,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    FloatingActionButton(
                      child: const Icon(Icons.plus_one),
                      onPressed: () => {
                        setState(() {
                          points++;
                        })
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      child: const Icon(Icons.exposure_minus_1_rounded),
                      onPressed: () => {
                        setState(() {
                          points--;
                        })
                      },
                    )
                  ],
                )
              ],
            ),
            Center(
              child: Text(
                points.toString(),
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
