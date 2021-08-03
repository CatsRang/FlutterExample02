import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login/model/login_model.dart';
import 'login/service/login_service.dart';
import 'main_router.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginModel()),
        ProxyProvider<LoginModel, LoginService>(
          update: (context, model, ctrl) => LoginService(loginModel: model),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Login Example',
        initialRoute: RoutePaths.Login,
        onGenerateRoute: MainRouter.generateRoute,
      ),
    );
  }
}
