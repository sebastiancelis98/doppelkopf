
import 'package:doppelkopf/model/game.dart';
import 'package:flutter/material.dart';

class GameData extends ChangeNotifier{

  Set<Game> games = <Game>{};

  GameData();

  void addGame(Game game){
    games.add(game);
    notifyListeners();
  }

  void deleteGame(Game game){
    games.remove(game);
    notifyListeners();
  }
}