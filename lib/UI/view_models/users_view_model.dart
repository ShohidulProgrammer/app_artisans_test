import 'package:app_artisans_test/data_models/users.dart';
import 'package:app_artisans_test/services/apis/rest_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserViewModel extends ChangeNotifier {
  int _pageNo = 1;
  String _btnTitle = 'Next Page';
  IconData _icon = Icons.arrow_forward;

  String get btnTitle => _btnTitle;
  IconData get icon => _icon;

  void togglePage() {
    _pageNo = _pageNo == 1 ? 2 : 1;
    _btnTitle = _pageNo == 1 ? 'Next Page' : 'Previous Page';
    _icon = _pageNo == 1 ? Icons.arrow_forward : Icons.arrow_back;
    notifyListeners();
  }

  Future<List<User>> loadUserData() async {
    try {
      var data = await RestApi.fetchData(pageNo: _pageNo);
      return data.map<User>((user) => new User.fromJson(user)).toList();
    } catch (e) {
      return List<User>();
    }
  }
}
