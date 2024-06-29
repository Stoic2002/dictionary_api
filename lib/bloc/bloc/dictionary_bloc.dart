import 'package:bloc/bloc.dart';
import 'package:dictionary_api/models/word_definition.dart';
import 'package:dictionary_api/repositories/dictionary_repository.dart';
import 'package:equatable/equatable.dart';

part 'dictionary_event.dart';
part 'dictionary_state.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  final DictionaryRepository repository;

  DictionaryBloc({required this.repository}) : super(DictionaryInitial()) {
    on<SearchWord>(_onSearchWord);
  }

  Future<void> _onSearchWord(
    SearchWord event,
    Emitter<DictionaryState> emit,
  ) async {
    print('Searching for word: ${event.word}');
    emit(DictionaryLoading());
    try {
      final definitions = await repository.getWordDefinition(event.word);
      print('Found ${definitions.length} definitions');
      emit(DictionaryLoaded(definitions));
    } catch (e) {
      print('Error: $e');
      emit(DictionaryError(e.toString()));
    }
  }
}
