import 'package:app_artisans_test/data_model/users.dart';
import 'package:app_artisans_test/services/api/get_data_from_server.dart';
import 'package:flutter/widgets.dart';

class UsersViewModel extends ChangeNotifier {
  int _pageNo = 1;
  int get pageNo => _pageNo;

  void togglePage() {
    _pageNo = _pageNo == 1 ? 2 : 1;
    notifyListeners();
  }

  Future<List<User>> loadUserData() async {
    var data = await RestApi.fetchData(pageNo: _pageNo);
    return data.map<User>((user) => new User.fromJson(user)).toList();
  }
}
