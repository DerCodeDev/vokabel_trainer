import 'package:flutter/material.dart';
import 'package:vokabel_trainer/manager/vocabulary_manager.dart';
import 'package:vokabel_trainer/utils/style.dart';
import 'package:vokabel_trainer/widgets/input_text_field.dart';

class AddVocabularyScreen extends StatefulWidget {
  const AddVocabularyScreen({super.key});

  @override
  State<AddVocabularyScreen> createState() => _AddVocabularyScreenState();
}

class _AddVocabularyScreenState extends State<AddVocabularyScreen> {
  final TextEditingController _germanController = TextEditingController();
  final TextEditingController _englishTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const Text(
                "Vokabel hinzufügen",
                style: Styling.textStyle,
              ),
              InputTextField(
                  labelText: "Deutsch...", controller: _germanController),
              InputTextField(
                  labelText: "Englisch...", controller: _englishTextController),
              OutlinedButton(
                onPressed: () {
                  if (_germanController.text.isEmpty ||
                      _englishTextController.text.isEmpty) {
                    return;
                  }

                  VocabularyManager.addVocabulary(
                      _germanController.text, _englishTextController.text);
                  _englishTextController.clear();
                  _germanController.clear();
                  FocusScope.of(context).unfocus();
                },
                child: const Text("Hinzufügen"),
              )
            ],
          )),
    );
  }
}
