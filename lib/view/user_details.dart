import 'package:app_artisans_test/configs/styls/text_styles.dart';
import 'package:app_artisans_test/services/color_from_hex.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  final user;

  const UserDetailsPage({this.user});
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
            child: Card(
              color: colorFromHex(user.color),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'ID: ${user.id}',
                      style: kSubTitleTextStyle,
                    ),
                    Text(
                      'Name: ${user.name}',
                      style: kBigTitleTextStyle,
                    ),
                    Text(
                      'Year: ${user.year}',
                      style: kTitleTextStyle,
                    ),
                    Text(
                      'Color: ${user.color}',
                      style: kTitleTextStyle,
                    ),
                    Text(
                      'Pantone Value: ${user.pantoneValue}',
                      style: kTitleTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
