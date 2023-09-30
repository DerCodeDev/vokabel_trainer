import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vokabel_trainer/utils/style.dart';

class VocabularyManager{
  static late String randomWord;
  static late String correctTranslation;
  static late bool selectKey;
  static Map<String, String> vocabularyMap = {};

  static void saveVocabularyMap() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('vocabularyMap', jsonEncode(vocabularyMap));
  }

  static Future<void> loadVocabularyMap() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? vocabMapJson = prefs.getString('vocabularyMap');

    if (vocabMapJson != null) {
      Map<String, dynamic> decodedMap = jsonDecode(vocabMapJson);

      vocabularyMap =
          decodedMap.map((key, value) => MapEntry(key, value.toString()));
    }
  }

  static void addVocabulary(final String germanWord, final String englishWord) {
    if (vocabularyMap.containsKey(germanWord)) {
      Styling.showToast("Die Vokabel existiert bereits!");
      return;
    }
    vocabularyMap[germanWord] = englishWord;
    saveVocabularyMap();
    Styling.showToast("Die Vokabel wurde erfolgreich hinzugefügt.");
  }

  static void nextRound() {
     selectKey = Random().nextBool();
    if (selectKey) {
      randomWord = vocabularyMap.keys
          .elementAt(Random().nextInt(vocabularyMap.length));
      correctTranslation = vocabularyMap[randomWord]!;
    } else {
      String key = vocabularyMap.keys.elementAt(Random().nextInt(vocabularyMap.length));
      randomWord = vocabularyMap[key]!;
      correctTranslation = key;
    }
  }

  static bool compare(final String typedWord) {
    return typedWord.toLowerCase() == correctTranslation.toLowerCase();
  }

  static void deleteVocabulary(final String key) {
    vocabularyMap.remove(key);
    saveVocabularyMap();
  }
}
