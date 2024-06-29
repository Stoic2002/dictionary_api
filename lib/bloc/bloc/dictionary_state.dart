part of 'dictionary_bloc.dart';

sealed class DictionaryState extends Equatable {
  const DictionaryState();

  @override
  List<Object> get props => [];
}

final class DictionaryInitial extends DictionaryState {}

class DictionaryLoading extends DictionaryState {}

class DictionaryLoaded extends DictionaryState {
  final List<WordDefinition> definitions;

  const DictionaryLoaded(this.definitions);

  @override
  List<Object> get props => [definitions];
}

class DictionaryError extends DictionaryState {
  final String message;

  const DictionaryError(this.message);

  @override
  List<Object> get props => [message];
}
