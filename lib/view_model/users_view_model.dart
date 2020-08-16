import 'dart:convert';

import 'package:app_artisans_test/data_model/users.dart';
import 'package:app_artisans_test/services/api/get_data_from_server.dart';
import 'package:flutter/widgets.dart';

class UsersViewModel extends ChangeNotifier {
  List<User> _users;

  // int get user => _users;

  // UsersViewModel() {}

  //  getUsers() async {
  //   _users = await fetchUserInfo();
  //   notifyListeners();
  // }

  Future<List<User>> fetchUserInfo() async {
    var data = await RestApi.getDataFromServer();
    return data.map<User>((user) => new User.fromJson(user)).toList();
  }
}
