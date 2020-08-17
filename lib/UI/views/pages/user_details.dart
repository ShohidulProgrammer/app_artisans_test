import 'package:app_artisans_test/configs/styles/text_styles.dart';
import 'package:app_artisans_test/services/utils/color_from_hex.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({this.user});
  final user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'User Details',
          style: kBigTitleTextStyle,
        ),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          child: Card(
            color: colorFromHex(user.color),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildText('ID: ${user.id}'),
                Text(
                  'Name: ${user.name}',
                  style: kBigTitleTextStyle,
                ),
                _buildText('Year: ${user.year}'),
                _buildText('Color: ${user.color}'),
                _buildText('Pantone Value: ${user.pantoneValue}'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _buildText(String text) {
    return Text(
      text,
      style: kTitleTextStyle,
    );
  }
}
