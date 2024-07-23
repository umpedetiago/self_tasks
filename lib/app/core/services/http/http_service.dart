import 'package:dio/dio.dart';
import 'package:self_tasks/app/core/services/http/i_http_service.dart';

class HttpService implements IHttpService {
  late final Dio _httpClient;
  HttpService({
    required Dio httpClient,
  }) : _httpClient = httpClient;
  @override
  Future<List<Map<String, dynamic>>> get(String path) async {
    final response = await _httpClient.get(path);
    final result = List<Map<String, dynamic>>.from(response.data);
    return result;
  }

  @override
  Future<Map<String, dynamic>> getDetails(String path) async {
    final response = await _httpClient.get(path);
    final result = response.data as Map<String, dynamic>;
    return result;
  }
}
