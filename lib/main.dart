import 'package:dictionary_api/bloc/bloc/dictionary_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/dictionary_repository.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary App',
      theme: AppTheme.lightTheme,
      home: BlocProvider(
        create: (context) => DictionaryBloc(
          repository: DictionaryRepository(),
        ),
        child: HomeScreen(),
      ),
    );
  }
}
