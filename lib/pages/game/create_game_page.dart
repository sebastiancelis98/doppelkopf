import 'package:flutter/material.dart';

class CreateGamePage extends StatelessWidget {
  const CreateGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a new game"),
      ),
      body: Column(
        children: const [
          Spacer(),
          Center(
            child: Text("Please enter the names of the 4 players:"),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: NameFields(),
          ),
          Spacer(flex: 3)
        ],
      ),
    );
  }
}

class NameFields extends StatefulWidget {
  const NameFields({Key? key}) : super(key: key);

  @override
  _NameFieldsState createState() => _NameFieldsState();
}

class _NameFieldsState extends State<NameFields> {
  final playerIds = [1, 2, 3, 4];

  final controllers = List.filled(4, TextEditingController());
  final focusNodes = List.filled(4, FocusNode());

  @override
  Widget build(BuildContext context) {
    final children = playerIds
        .map((i) => Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Player ' + i.toString(),
                  errorText: null,
                  prefixIcon: const Icon(Icons.person),
                ),
                onFieldSubmitted: (value) {
                  if(i == playerIds.length){
                    return;
                  }
                  // focusNodes.elementAt(i).requestFocus();
                },
              ),
        ))
        .toList();

    return Column(children: children);
  }
}
