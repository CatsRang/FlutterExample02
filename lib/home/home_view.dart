import 'package:flutter/material.dart';

import '../main_router.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RoutePaths.Home),
        actions: <Widget>[
          TextButton(
            child: Text('Logout'),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(RoutePaths.Login, (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
