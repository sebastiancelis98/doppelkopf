import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        leading: IconButton(
          onPressed: () => {
            Navigator.pop(context)
        },
        icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(),
    );
  }
}