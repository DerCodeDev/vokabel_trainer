
import 'package:flutter/material.dart.';

class VocabularyItemWidget extends StatelessWidget {
  final String germanWord;
  final String englishWord;
  final VoidCallback onDelete;

  const VocabularyItemWidget({super.key, required this.germanWord, required this.englishWord, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(germanWord),
      subtitle: Text(englishWord),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
