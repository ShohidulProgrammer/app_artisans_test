import 'package:http/http.dart' as http;
import 'dart:convert';

Future getDataFromServer({int pageNo: 1}) async {
  String _url =
      "https://reqres.in/api/unknown/?page=$pageNo"; // with my Banglalink mobile no
  try {
    http.Response response = await http.get(_url);
    if (response.statusCode == 200) {
      var result = await jsonDecode(response.body);
      var data = result["data"];
      // print('Api Result: $data\n\n\n');
      for (final i in data) {
        print('index: $i');
        // if (i == 2) {
        //   break;
        // }
      }

      return data;
    } else {
      print('network error');
      return null;
    }
  } catch (e) {
    print('SocketException: $e');
    return null;
  }
}
