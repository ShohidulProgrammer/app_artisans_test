import 'package:http/http.dart' as http;
import 'dart:convert';

class RestApi {
  static Future fetchData({int pageNo: 1}) async {
    final String _url = "https://reqres.in/api/unknown/?page=$pageNo";
    try {
      http.Response response = await http.get(_url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['data'];
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Http request SocketException: $e');
      return null;
    }
  }
}
