import 'dart:convert';

import 'package:doppelkopf/model/game.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameData extends ChangeNotifier {
  bool hasLoaded = false;
  Set<Game> games = <Game>{};

  GameData();
  GameData.fromJson(Map<String, dynamic> json)
      : games = (json['games'] as List<dynamic>)
            .map((e) => Game.fromJson(e))
            .toSet();

  Map<String, dynamic> toJson() => {
        "games": games.map((game) => game.toJson()).toList(),
      };

  void updateFromJson(Map<String, dynamic> json) {
    games = (json['games'] as List<dynamic>)
            .map((e) => Game.fromJson(e))
            .toSet();
  }

  void addGame(Game game) {
    games.add(game);
    notifyListeners();
  }

  void deleteGame(Game game) {
    games.remove(game);
    saveGameData();
  }

  void saveGameData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('game_data', json.encode(toJson()));
    notifyListeners();
  }

  void loadGameData() async {
    if (hasLoaded) {
      return;
    }
    hasLoaded = true;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('game_data')){
      return;
    }
    updateFromJson(json.decode(prefs.getString('game_data') ?? ''));
    notifyListeners();
  }
}
