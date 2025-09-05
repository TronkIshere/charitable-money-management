import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/core/api/api_response.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  final _storage = const FlutterSecureStorage();

  ApiClient({required this.baseUrl});

  Future<Map<String, String>> _getHeaders({bool multipart = false}) async {
    final token = await _storage.read(key: 'token');
    return {
      if (!multipart) 'Content-Type': 'application/json',
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
  }

  Future<ApiResponse<T>> get<T>(String path, T Function(dynamic) fromJsonT) async {
    final headers = await _getHeaders();
    final response = await http.get(Uri.parse('$baseUrl$path'), headers: headers);
    return _handleResponse(response, fromJsonT);
  }

  Future<ApiResponse<T>> post<T>(String path, Map<String, dynamic> body, T Function(dynamic) fromJsonT) async {
    final headers = await _getHeaders();
    final response = await http.post(Uri.parse('$baseUrl$path'), headers: headers, body: jsonEncode(body));
    return _handleResponse(response, fromJsonT);
  }

  Future<ApiResponse<T>> multipartPost<T>(
    String path, {
    required Map<String, String> fields,
    required List<File> files,
    T Function(dynamic)? fromJsonT,
  }) async {
    final headers = await _getHeaders(multipart: true);
    final uri = Uri.parse('$baseUrl$path');

    final request = http.MultipartRequest('POST', uri);
    request.headers.addAll(headers);

    request.fields.addAll(fields);

    for (var file in files) {
      final multipartFile = await http.MultipartFile.fromPath('attachments', file.path);
      request.files.add(multipartFile);
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    try {
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (fromJsonT != null) {
        return ApiResponse<T>.fromJson(json, fromJsonT);
      } else {
        return ApiResponse<T>.fromJson(json, (data) => null as T);
      }
    } catch (e) {
      return ApiResponse<T>(success: false, error: ApiError(code: -1, message: e.toString()));
    }
  }

  ApiResponse<T> _handleResponse<T>(http.Response response, T Function(dynamic) fromJsonT) {
    final Map<String, dynamic> json = jsonDecode(response.body);
    return ApiResponse<T>.fromJson(json, fromJsonT);
  }
}
