abstract class IHttpService {
  Future<List<Map<String, dynamic>>> get(String path);
  Future<Map<String, dynamic>> getDetails(String path);
}
