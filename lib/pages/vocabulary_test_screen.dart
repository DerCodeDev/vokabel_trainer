import 'package:flutter/material.dart';
import 'package:vokabel_trainer/manager/vocabulary_manager.dart';
import 'package:vokabel_trainer/utils/style.dart';
import 'package:vokabel_trainer/widgets/input_text_field.dart';

class VocabularyTestScreen extends StatefulWidget {
  const VocabularyTestScreen({super.key});

  @override
  State<VocabularyTestScreen> createState() => _VocabularyTestScreenState();
}

class _VocabularyTestScreenState extends State<VocabularyTestScreen> {
  final TextEditingController _controller = TextEditingController();

  String resultText = '';

  void checkAnswer(String typedWord) {
    bool isCorrect = VocabularyManager.compare(typedWord);
    setState(() {
      resultText = isCorrect ? "Richtig!" : "Falsch!";
      VocabularyManager.nextRound();
      _controller.clear();
    });
  }

  @override
  void initState() {
    VocabularyManager.nextRound();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vokabel Trainer"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text("Englisches Wort für: ",style: Styling.textStyle),
             Text(VocabularyManager.randomWord,style: Styling.textStyleWord,),
            InputTextField(labelText: "Deine Antwort", controller: _controller),
            OutlinedButton(onPressed: () {
              if(_controller.text.isEmpty) {
                return;
              }
              checkAnswer(_controller.text);
            }, child: const Text("Vergleichen")),
            SizedBox(
                height: 20,
                child: Text(resultText,
                    style: TextStyle(
                      fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: resultText == "Richtig!"
                            ? Colors.green
                            : Colors.red))),
          ],
        ),
      ),
    );
  }
}
