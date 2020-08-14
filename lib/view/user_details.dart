import 'package:app_artisans_test/utils/color_from_hex.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('User Details'),
        ),
        body: ListView.builder(
          itemCount: 5,
          // itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              // decoration: new BoxDecoration(
              //    ),
              color: index % 2 == 0 ? colorFromHex('#B74093') : Colors.green,

              child: ListTile(
                onTap: () => print('The index is: $index'),
                title: Text('Hasan'),
                subtitle: Text('2020'),
                // title: Text('${items[index]}'),
              ),
            );
          },
        ));
  }
}
