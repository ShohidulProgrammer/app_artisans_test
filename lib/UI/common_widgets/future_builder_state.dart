import 'package:app_artisans_test/configs/styles/text_styles.dart';
import 'package:flutter/material.dart';

class FutureBuilderState extends StatelessWidget {
  final AsyncSnapshot snapshot;

  const FutureBuilderState({this.snapshot});
  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else if (snapshot.hasError) {
      debugPrint("Error: ${snapshot.error}");
      return _buildState(title: 'Network Error');
    } else {
      return _buildState();
    }
  }

  Widget _buildState({String title: 'No Data'}) {
    return Center(
        child: Text(
      title,
      style: kTitleTextStyle.copyWith(color: Colors.black),
    ));
  }
}
