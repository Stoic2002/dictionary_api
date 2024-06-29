import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/word_definition.dart';
import '../utils/api_constants.dart';

class DictionaryRepository {
  Future<List<WordDefinition>> getWordDefinition(String word) async {
    print('Fetching definition for: $word');
    final response = await http.get(Uri.parse('${ApiConstants.baseUrl}$word'));
    print('API Response status: ${response.statusCode}');
    print('API Response body: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => WordDefinition.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load word definition');
    }
  }
}
