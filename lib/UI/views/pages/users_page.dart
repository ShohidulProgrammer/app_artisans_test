import 'package:app_artisans_test/UI/common_widgets/future_builder_state.dart';
import 'package:app_artisans_test/UI/view_models/users_view_model.dart';
import 'package:app_artisans_test/UI/views/widgets/user_list_builder.dart';
import 'package:app_artisans_test/configs/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserViewModel _data = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
          style: kBigTitleTextStyle,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _data.loadUserData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData &&
              snapshot.data.length > 0 &&
              snapshot.connectionState == ConnectionState.done) {
            return UserListBuilder(snapshot: snapshot);
          }
          return FutureBuilderState(
            snapshot: snapshot,
          );
        },
      ),
      floatingActionButton: _floatingActionButton(_data),
    );
  }

  FloatingActionButton _floatingActionButton(final _data) {
    return FloatingActionButton.extended(
      onPressed: () => _data.togglePage(),
      label: Text('${_data.btnTitle}'),
      icon: Icon(_data.icon),
    );
  }
}
