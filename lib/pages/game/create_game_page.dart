import 'package:doppelkopf/pages/game/game_page.dart';
import 'package:doppelkopf/services/transitions/transition_utils.dart';
import 'package:flutter/material.dart';

class CreateGamePage extends StatelessWidget {
  const CreateGamePage({Key? key}) : super(key: key);

  bool attemptGameCreation() {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    NameFields nameFieldWidgets = NameFields();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a new game"),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: const Center(
              child: Text(
                "Please enter the names of the 4 players",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: nameFieldWidgets,
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: TextButton(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text(
                  'Start game',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
              ),
              onPressed: () => {
                if (nameFieldWidgets.allFieldsAreValid())
                  {
                    Navigator.of(context)
                        .pushReplacement(slideTransitionBuilder(
                            GamePage(
                              playerNames: nameFieldWidgets.getFieldValues(),
                            ),
                            SlideType.LEFT))
                  }
              },
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  const BorderSide(
                    color: Colors.black12,
                    style: BorderStyle.solid,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                shadowColor: MaterialStateProperty.all(Colors.white70),
                foregroundColor: MaterialStateProperty.all(Colors.red),
                elevation: MaterialStateProperty.all(5),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NameFields extends StatefulWidget {
  NameFields({Key? key}) : super(key: key);

  final fieldControllers = List.generate(4, (_) => TextEditingController());

  @override
  _NameFieldsState createState() => _NameFieldsState();

  bool allFieldsAreValid() {
    return fieldControllers
        .map((e) => _isValidField(e.text))
        .every((element) => element);
  }

  Set<String> getFieldValues() {
    return fieldControllers.map((e) => e.text).toSet();
  }

  bool _isValidField(String field) {
    return field.length >= 4 && field.length <= 15;
  }
}

class _NameFieldsState extends State<NameFields> {
  final playerIds = [0, 1, 2, 3];

  final focusNodes = List.generate(4, (_) => FocusNode());

  List errorTexts = List.filled(4, null);

  @override
  Widget build(BuildContext context) {
    final textInputFields = playerIds
        .map((i) => Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: TextFormField(
                controller: widget.fieldControllers.elementAt(i),
                keyboardType: TextInputType.name,
                textInputAction: i != playerIds.length
                    ? TextInputAction.next
                    : TextInputAction.done,
                focusNode: focusNodes.elementAt(i),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.amber)),
                  labelText: 'Player ' + (i + 1).toString(),
                  errorText: errorTexts.elementAt(i),
                  prefixIcon: const Icon(Icons.person),
                ),
                onChanged: (value) => {
                  if (errorTexts.elementAt(i) != null)
                    {
                      if (widget._isValidField(value))
                        {
                          setState(() {
                            errorTexts[i] = null;
                          })
                        }
                    }
                },
                onFieldSubmitted: (value) {
                  dynamic _errorText;
                  if (!widget._isValidField(value)) {
                    _errorText =
                        "Please enter a name between 4 and 15 characters!";
                        focusNodes.elementAt(i).requestFocus();
                  }
                  setState(() {
                    errorTexts[i] = _errorText;
                  });
                },
              ),
            ))
        .toList();

    return Column(
      children: textInputFields,
    );
  }
}
