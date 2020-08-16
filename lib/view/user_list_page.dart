import 'package:app_artisans_test/configs/routers/router_path_const.dart';
import 'package:app_artisans_test/configs/styls/text_styles.dart';
import 'package:app_artisans_test/services/color_from_hex.dart';
import 'package:app_artisans_test/view_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
          style: kBigTitleTextStyle,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length ?? 0,
                itemBuilder: (context, index) {
                  final user = snapshot.data[index];

                  return _buildListItem(context, user);
                },
              );
            } else {
              return Center(
                  child: Text(
                'No data',
                style: kTitleTextStyle.copyWith(color: Colors.black),
              ));
            }
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
              "${snapshot.error}",
              style: kTitleTextStyle.copyWith(color: Colors.black),
            ));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: Provider.of<UsersViewModel>(context).fetchUserInfo(),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, final user) {
    return Card(
      color: colorFromHex(user.color),
      child: ListTile(
        onTap: () =>
            Navigator.pushNamed(context, userDetailsPageRoute, arguments: user),
        title: Text(
          user.name,
          style: kTitleTextStyle,
        ),
        subtitle: Text(
          '${user.year}',
          style: kSubTitleTextStyle,
        ),
        // title: Text('${items[index]}'),
      ),
    );
  }
}
