import 'package:provider/provider.dart';

import 'login/model/login_model.dart';
import 'login/service/login_service.dart';

MultiProvider mainProviders = MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context) => LoginModel()),
    ProxyProvider<LoginModel, LoginService>(
      update: (context, model, ctrl) => LoginService(loginModel: model),
    ),
  ],
);
