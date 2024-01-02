import 'dart:convert';

import 'package:http/http.dart' as http;

// TODO All Api call will be here

class ToDoService {
  static Future<bool> deleteById(String id) async {
    final url = 'http://api.nstack.in/v1/todos/$id';

    final uri = Uri.parse(url);

    final reponse = await http.delete(uri);

    return reponse.statusCode == 200;
  }

  static Future<List?> fetchTodo() async {
    final url = 'http://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final reponse = await http.get(uri);
    if (reponse.statusCode == 200) {
      final json = jsonDecode(reponse.body) as Map;
      final result = json['items'] as List;
      return result;
    } else {
      return null;
    }
  }
}
