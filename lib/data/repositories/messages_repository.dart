import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_lunapp/presentation/template/template.dart';

class MessagesRepository {
  Future<MessagesModel?> getMessages(String link) async {
    final response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      return MessagesModel.fromJson(json.decode(response.body,
          reviver: (key, value) =>
              value is String ? utf8.decode(value.codeUnits) : value));
    } else {
      return null;
    }
  }
}
