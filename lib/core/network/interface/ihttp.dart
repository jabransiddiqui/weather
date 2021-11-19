abstract class IHTTP {
  Future<dynamic> iGet(String url, {Map<String, dynamic> queryParameters});
  Future<dynamic> iPost(String url,
      {Map<String, dynamic> data, Map<String, dynamic> queryParameters});
  Future<dynamic> iPut(String url,
      {Map<String, dynamic> data, Map<String, dynamic> queryParameters});
  Future<dynamic> iDelete(String url,
      {Map<String, dynamic> data, Map<String, dynamic> queryParameters});
}
