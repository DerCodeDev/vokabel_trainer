import 'package:flutter/material.dart';
import 'package:vokabel_trainer/manager/vocabulary_manager.dart';
import 'package:vokabel_trainer/pages/vocabulary_test_screen.dart';
import 'package:vokabel_trainer/utils/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    VocabularyManager.loadVocabularyMap();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Vokabeltrainer by Samir Ademi",
              style: Styling.textStyle,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (VocabularyManager.vocabularyMap.isEmpty) {
                      Styling.showToast(
                          "Bitte füge Vokabeln hinzu, um den Test zu starten.");
                      return;
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const VocabularyTestScreen()));
                  },
                  child: const Text(
                    "Vokabel Test Starten",
                    style: Styling.textStyle,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
