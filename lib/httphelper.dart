import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pml/model/pizza.dart';

class HttpHelper {
  // Pola Singleton (Slide 13)
  static final HttpHelper _httpHelper = HttpHelper._internal();
  HttpHelper._internal();
  factory HttpHelper() {
    return _httpHelper;
  }

  // GANTI dengan domain Mock API WireMock Cloud milikmu (tanpa https://)
  final String authority = 'k7jml1.wiremockapi.cloud';
  final String path = 'pizzalist';

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    final http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      List<Pizza> pizzas =
          jsonResponse.map<Pizza>((i) => Pizza.fromJson(i)).toList();
      return pizzas;
    } else {
      return [];
    }
  }
}