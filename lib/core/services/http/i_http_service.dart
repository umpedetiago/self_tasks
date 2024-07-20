abstract interface class IHttpService {
  Future<List<Map<String, dynamic>>> get(String path);
}
