import 'package:app_artisans_test/view_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'configs/routers/router.dart';
import 'configs/routers/router_path_const.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UsersViewModel()),
        // Provider(builder: (_) => httpDb.fetchAllMassages()),

        // Provider(builder: (_) => sendQueueSms),
        // Provider(builder: (_) => SendQueueSmsBlock),

        // ChangeNotifierProvider<SendQueueSmsBlock>.value(
        //   value: SendQueueSmsBlock(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Color Api',
        theme: new ThemeData(
            // scaffoldBackgroundColor: Color(0xfffafaff),
            // primaryColor: mainBlue,
            // fontFamily: 'SF Pro Display',
            ),
        onGenerateRoute: Router.generateRoute,
        initialRoute: usersPageRoute,
        // ),
      ),
    );
  }
}
