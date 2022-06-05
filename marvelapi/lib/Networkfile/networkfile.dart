import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:marvelapi/Models/MOdelVIew.dart';

class Repository {
  Future<McuModel?> getApi() async {
    String marvelApiUrl = "https://mcuapi.herokuapp.com/api/v1/movies";
    final uri = Uri.parse(marvelApiUrl);
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      return null;
    }
    final responseBody = response.body;
    final result = jsonDecode(responseBody);

    final decodedData = result['data'];
    return McuModel.fromJson(decodedData);
  }
}
