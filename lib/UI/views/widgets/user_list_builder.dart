import 'package:app_artisans_test/configs/routers/router_path_const.dart';
import 'package:app_artisans_test/configs/styles/text_styles.dart';
import 'package:app_artisans_test/services/utils/color_from_hex.dart';
import 'package:flutter/material.dart';

class UserListBuilder extends StatelessWidget {
  const UserListBuilder({this.snapshot});
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data.length ?? 0,
      itemBuilder: (context, index) {
        final user = snapshot.data[index];
        return _buildListItem(context, user);
      },
    );
  }

  Widget _buildListItem(BuildContext context, final _user) {
    return Card(
      color: colorFromHex(_user.color),
      child: ListTile(
        onTap: () => Navigator.pushNamed(context, userDetailsPageRoute,
            arguments: _user),
        title: Text(
          _user.name,
          style: kTitleTextStyle,
        ),
        subtitle: Text(
          '${_user.year}',
          style: kSubTitleTextStyle,
        ),
      ),
    );
  }
}
