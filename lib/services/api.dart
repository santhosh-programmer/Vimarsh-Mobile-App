import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vimarsh/models/data.dart';

class Api {
  static Future<List<Data>?> getData({int? month, int? year}) async {
    try {
      String url = "https://server.viyugha.tech/api/crimes/";
      if (month != null) url += '?month=$month&year=$year';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        data = data.map((e) => Data.fromJson(e)).toList();
        return data as List<Data>;
      } else {
        print(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
