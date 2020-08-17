import 'package:app_artisans_test/configs/routers/router_path_const.dart';
import 'package:app_artisans_test/configs/styls/text_styles.dart';
import 'package:app_artisans_test/services/color_from_hex.dart';
import 'package:app_artisans_test/view_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UsersViewModel _data = Provider.of<UsersViewModel>(context);
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
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return _buildUserList(context, snapshot);
            } else {
              print('No data');
              return Center(
                  child: Text(
                'No data',
                style: kTitleTextStyle.copyWith(color: Colors.blue),
              ));
            }
          } else {
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                "${snapshot.error}",
                style: kTitleTextStyle.copyWith(color: Colors.black),
              ));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              print('No data');
              return Center(
                  child: Text(
                'No data',
                style: kTitleTextStyle.copyWith(color: Colors.blue),
              ));
            }
          }
        },
      ),
      floatingActionButton: _floatingActionButton(_data),
    );
  }

  FloatingActionButton _floatingActionButton(final _data) {
    return FloatingActionButton.extended(
      onPressed: () => _data.togglePage(),
      label: Text('Change Page ${_data.pageNo}'),
      icon: Icon(Icons.track_changes),
    );
  }

  Widget _buildUserList(BuildContext context, final _snapshot) {
    return ListView.builder(
      itemCount: _snapshot.data.length ?? 0,
      itemBuilder: (context, index) {
        final user = _snapshot.data[index];

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
        // title: Text('${items[index]}'),
      ),
    );
  }
}
