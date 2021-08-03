import 'package:flutter/foundation.dart';

enum LoginStatus {
  none,
  in_progress,
  success,
  fail
}

class LoginModel with ChangeNotifier {
  LoginStatus _loginStatus = LoginStatus.none;

  get loginStatus {
    return _loginStatus;
  }

  set loginStatus(LoginStatus status) {
    this._loginStatus =  status;
    notifyListeners();
  }
}
