import 'package:flutter/material.dart';
import 'package:vokabel_trainer/manager/vocabulary_manager.dart';
import 'package:vokabel_trainer/utils/style.dart';
import 'package:vokabel_trainer/widgets/vocabulary_item.dart';

class MyVocabularyScreen extends StatefulWidget {
  const MyVocabularyScreen({super.key});

  @override
  State<MyVocabularyScreen> createState() => _MyVocabularyScreenState();
}

class _MyVocabularyScreenState extends State<MyVocabularyScreen> {
  void _deleteVocabulary(String key) {
    setState(() {
      VocabularyManager.deleteVocabulary(key);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VocabularyManager.vocabularyMap.isEmpty
          ? const Center(
              child: Text(
              "Keine Vokabeln vorhanden.",
              style: Styling.textStyle,
            ))
          : ListView.builder(
              itemBuilder: (context, index) {
                String germanWord =
                    VocabularyManager.vocabularyMap.keys.elementAt(index);
                String englishWord =
                    VocabularyManager.vocabularyMap.values.elementAt(index);

                return VocabularyItemWidget(
                  germanWord: germanWord,
                  englishWord: englishWord,
                  onDelete: () {
                    _deleteVocabulary(germanWord);
                  },
                );
              },
              itemCount: VocabularyManager.vocabularyMap.length,
            ),
    );
  }
}
