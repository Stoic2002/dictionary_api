import 'package:dictionary_api/bloc/bloc/dictionary_bloc.dart';
import 'package:dictionary_api/widgets/search_bar.dart';
import 'package:dictionary_api/widgets/word_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary App'),
      ),
      body: Column(
        children: [
          SearchBart(),
          Expanded(
            child: BlocBuilder<DictionaryBloc, DictionaryState>(
              builder: (context, state) {
                print('Current state: $state');
                if (state is DictionaryInitial) {
                  return Center(child: Text('Search for a word'));
                } else if (state is DictionaryLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is DictionaryLoaded) {
                  return ListView.builder(
                    itemCount: state.definitions.length,
                    itemBuilder: (context, index) {
                      return WordCard(definition: state.definitions[index]);
                    },
                  );
                } else if (state is DictionaryError) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
