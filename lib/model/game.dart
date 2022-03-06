import 'package:doppelkopf/model/player.dart';
import 'package:intl/intl.dart';

class Game {
  String id;
  DateTime creationDate;
  Set<Player> players;

  Game({required this.id, required this.players})
      : creationDate = DateTime.now();

  Game.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    creationDate = DateTime.parse(json['creation_date']),
    players = (json['players'] as List<dynamic>).map((e) => Player.fromJson(e)).toSet();

  Map<String, dynamic> toJson() => {
        'id': id,
        'creation_date': creationDate.toString(),
        'players': players.map((e) => e.toJson()).toList(),
      };

  String getAbbreviatedFormattedDate() {
    return DateFormat('EEE, MMM d').format(creationDate);
  }
}
