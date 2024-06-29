import 'package:flutter/material.dart';
import '../models/word_definition.dart';
import 'audio_player.dart';

class WordCard extends StatelessWidget {
  final WordDefinition definition;

  const WordCard({Key? key, required this.definition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              definition.word,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 8),
            if (definition.phonetic != null)
              Text(
                definition.phonetic!,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            if (definition.phonetics.isNotEmpty &&
                definition.phonetics.first.audio != null)
              AudioPlayer(audioUrl: definition.phonetics.first.audio!),
            SizedBox(height: 16),
            ...definition.meanings
                .map((meaning) => _buildMeaning(context, meaning)),
          ],
        ),
      ),
    );
  }

  Widget _buildMeaning(BuildContext context, Meaning meaning) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          meaning.partOfSpeech,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ...meaning.definitions.map((def) => _buildDefinition(def)),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDefinition(Definition def) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ${def.definition}'),
          if (def.example != null)
            Text(
              'Example: ${def.example}',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
        ],
      ),
    );
  }
}
