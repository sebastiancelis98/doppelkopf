import 'package:doppelkopf/model/gamedata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameData(),
      child: const MaterialApp(
        title: 'Doppelkopf Counter',
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
