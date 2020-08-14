import 'package:app_artisans_test/data_model/users.dart';
import 'package:app_artisans_test/utils/api/get_data_from_server.dart';
import 'package:flutter/widgets.dart';

class UsersViewModel extends ChangeNotifier {
  User user;
  var data;

  Future<User> fetchUserInfo() async {
    user = User.fromJson(await getDataFromServer());
    print('User: $user');

    data = user;
 

    return user;
  }
}
