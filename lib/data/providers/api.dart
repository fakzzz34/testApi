import 'package:dio/dio.dart';

const url = 'https://reqres.in'; // base url dari api

class ApiProvider {
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: url,
        headers: {"Accept": "application/json"},
        connectTimeout: 60 * 1000, // 60 seconds
        receiveTimeout: 60 * 1000 // 60 seconds
        ),
  );

  Future<Response> ListUsers() =>
      _dio.get('/api/users?page=2'); // ngambil request get dari endpoint ini
}
