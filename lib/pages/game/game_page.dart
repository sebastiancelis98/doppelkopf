import 'package:doppelkopf/model/game.dart';
import 'package:doppelkopf/model/player.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GamePage extends StatelessWidget {

  final Game game;

  const GamePage({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> playerCards = game.players
        .map((player) => PlayerCard(
              player: player,
            ))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Game from " + DateFormat("EEE, MMM d").format(game.creationDate)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: playerCards,
      ),
    );
  }
}

class PlayerCard extends StatefulWidget {
  final Player player;

  const PlayerCard({Key? key, required this.player}) : super(key: key);

  @override
  _PlayerCardState createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {

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
                  widget.player.name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    FloatingActionButton(
                      heroTag: widget.player.name + '_minus_btn',
                      child: const Icon(Icons.exposure_minus_1_rounded),
                      onPressed: () => {
                        setState(() {
                          widget.player.points--;
                        })
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      heroTag: widget.player.name + '_plus_btn',
                      child: const Icon(Icons.plus_one),
                      onPressed: () => {
                        setState(() {
                          widget.player.points++;
                        })
                      },
                    )
                  ],
                )
              ],
            ),
            Center(
              child: Text(
                widget.player.points.toString(),
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
