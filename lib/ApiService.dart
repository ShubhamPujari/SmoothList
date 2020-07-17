import 'dart:convert';

import 'package:higgletaskapp/UserModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String _baseUrl = "https://reqres.in/api/users";
  static Map<String, String> headers = {"Content-Type": "application/json"};

  static Future<List<UserModel>> fetchUsers(int page) async {
    String finalUrl = _baseUrl + "?page=${page.toString()}";
    http.Client client = new http.Client();
    http.Response response = await client.get(finalUrl, headers: headers);
    if (response.statusCode == 200) {
      final movieResults = json.decode(response.body);
      Iterable list = movieResults['data'];
      List<UserModel> listMovie =
          List<UserModel>.from(list.map((i) => UserModel.fromJson(i)));

      return listMovie;
    } else {
      throw Exception("Failed to Fetch Users");
    }
  }
}
