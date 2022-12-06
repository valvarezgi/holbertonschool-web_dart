import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> generateQuote(id) async {
  try {
    var url = Uri.parse('https://www.breakingbadapi.com/api/quotes/$id');
    final response = await http.get(url);
    var data = jsonDecode(response.body);
    if (data.length == 0) {
      throw Error();
    }

    return '${data[0]['author']} : ${data[0]['quote']}';
  } catch (e) {
    return 'There are no quotes';
  }
}
