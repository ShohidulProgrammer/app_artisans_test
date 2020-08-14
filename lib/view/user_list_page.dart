import 'package:app_artisans_test/configs/styls/text_styles.dart';
import 'package:app_artisans_test/utils/api/get_data_from_server.dart';
import 'package:app_artisans_test/utils/color_from_hex.dart';
import 'package:flutter/material.dart';

class UsersListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getDataFromServer();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
          style: kBigTitleTextStyle,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        // itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildListItem(index);
        },
      ),
    );
  }

  Widget _buildListItem(int index) {
    return Card(
      color: index % 2 == 0 ? colorFromHex('#B74093') : Colors.green,
      child: ListTile(
        onTap: () => getDataFromServer(),
        title: Text(
          'Hasan',
          style: kTitleTextStyle,
        ),
        subtitle: Text(
          '2020',
          style: kSubTitleTextStyle,
        ),
        // title: Text('${items[index]}'),
      ),
    );
  }
}
