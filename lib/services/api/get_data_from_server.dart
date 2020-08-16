import 'package:http/http.dart' as http;
import 'dart:convert';

class RestApi {
  static Future getDataFromServer({int pageNo: 1}) async {
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

  // static postDataToServer() async {
  //   final String _url = "https://reqres.in/api/unknown/?page=4";
  //   try {
  //     var response =
  //         await http.post(_url, body: {'name': 'doodle', 'color': 'blue'});
  //     print('Post Response status: ${response.statusCode}');
  //     print('Post Response body: ${response.body}');
  //   } catch (e) {
  //     print('Post Response status error: $e');
  //   }
  // }
}
