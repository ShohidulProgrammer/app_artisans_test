import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'UI/view_models/users_view_model.dart';
import 'configs/routers/router.dart';
import 'configs/routers/router_path_const.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Color Name',
        onGenerateRoute: Router.generateRoute,
        initialRoute: usersPageRoute,
      ),
    );
  }
}
