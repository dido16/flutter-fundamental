import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pml/model/pizza.dart';

class HttpHelper {
  // Untuk memastikan kelas HttpHelper hanya diinstansiasikan sekali sajja
  static final HttpHelper _httpHelper = HttpHelper._internal();
  HttpHelper._internal();
  factory HttpHelper() {
    return _httpHelper;
  }

  // Domain Mock API WireMock Cloud dan endpoint dasar
  final String authority = 'k7jml1.wiremockapi.cloud';
  final String path = 'pizzalist';

  // Fungsi helper untuk menangani pesan error HTTP (404, 500, dll)
  String _handleHttpError(int statusCode) {
    if (statusCode == HttpStatus.notFound) {
      return 'Error 404: Endpoint atau data tidak ditemukan.';
    } else if (statusCode >= HttpStatus.internalServerError) {
      return 'Error $statusCode: Terjadi kesalahan pada server.';
    }
    return 'Error $statusCode: Permintaan gagal diproses.';
  }

  // GET /pizzalist: Digunakan untuk mengambil daftar pizza dan mengembalikan list kosong jika gagal
  Future<List<Pizza>> getPizzaList() async {
    try {
      final Uri url = Uri.https(authority, path);
      final http.Response result = await http.get(url);

      if (result.statusCode == HttpStatus.ok) {
        final jsonResponse = json.decode(result.body);
        return jsonResponse.map<Pizza>((i) => Pizza.fromJson(i)).toList();
      } else {
        debugPrint(_handleHttpError(result.statusCode));
        return [];
      }
    } catch (e) {
      debugPrint('Exception GET: $e');
      return [];
    }
  }

  // POST /pizza: Mengirimkan data pizza baru dan mengecek status 201 Created
  Future<String> postPizza(Pizza pizza) async {
    try {
      const postPath = '/pizza';
      String post = json.encode(pizza.toJson());
      Uri url = Uri.https(authority, postPath);
      http.Response r = await http.post(url, body: post);

      if (r.statusCode == HttpStatus.created || r.statusCode == HttpStatus.ok) {
        return r.body;
      }
      return _handleHttpError(r.statusCode);
    } catch (e) {
      return 'Gagal mengirim data: $e';
    }
  }

  // PUT /pizza: Memperbarui data pizza yang ada dan mengecek status 200 OK
  Future<String> putPizza(Pizza pizza) async {
    try {
      const putPath = '/pizza';
      String put = json.encode(pizza.toJson());
      Uri url = Uri.https(authority, putPath);
      http.Response r = await http.put(url, body: put);

      if (r.statusCode == HttpStatus.ok) {
        return r.body;
      }
      return _handleHttpError(r.statusCode);
    } catch (e) {
      return 'Gagal memperbarui data: $e';
    }
  }

  // DELETE /pizza: Untuk menghapus data pizza berdasarkan ID lalu melakukan pengecekan status 200 OK
  Future<String> deletePizza(int id) async {
    try {
      const deletePath = '/pizza';
      Uri url = Uri.https(authority, deletePath);
      http.Response r = await http.delete(url);

      if (r.statusCode == HttpStatus.ok) {
        return r.body;
      }
      return _handleHttpError(r.statusCode);
    } catch (e) {
      return 'Gagal menghapus data: $e';
    }
  }
}
