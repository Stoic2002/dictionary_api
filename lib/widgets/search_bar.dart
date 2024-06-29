import 'package:dictionary_api/bloc/bloc/dictionary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBart extends StatefulWidget {
  @override
  _SearchBartState createState() => _SearchBartState();
}

class _SearchBartState extends State<SearchBart> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submitSearch() {
    final word = _controller.text.trim();
    if (word.isNotEmpty) {
      print('Manual submit for: $word');
      BlocProvider.of<DictionaryBloc>(context).add(SearchWord(word));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search for a word',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onSubmitted: (value) {
                print('Submitting search for: $value');
                BlocProvider.of<DictionaryBloc>(context).add(SearchWord(value));
              },
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: _submitSearch,
            child: Text('Search'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
