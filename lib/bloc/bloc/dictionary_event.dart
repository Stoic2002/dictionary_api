part of 'dictionary_bloc.dart';

sealed class DictionaryEvent extends Equatable {
  const DictionaryEvent();

  @override
  List<Object> get props => [];
}

class SearchWord extends DictionaryEvent {
  final String word;

  const SearchWord(this.word);

  @override
  List<Object> get props => [word];
}
