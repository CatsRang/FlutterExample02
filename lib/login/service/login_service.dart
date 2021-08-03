import 'package:flutter_example02/login/model/login_model.dart';

class LoginService {
  LoginModel loginModel;
  LoginService({this.loginModel});

  /// 가상의 login 이벤트 핸들러
  /// 'LoginView > 로그인 버튼'의 onPressed에서 호출된다.
  Future<LoginStatus> handleLogin(String user_id, String passwd) async {
    loginModel.loginStatus = LoginStatus.in_progress;

    // TODO 로그인 처리하기
    // 여기서는 가상으로 처리하고 임의의 지연시간을 준다.
    await new Future.delayed(const Duration(milliseconds: 500), () => "1");

    if ("admin" == user_id && "pass" == passwd) {
      loginModel.loginStatus = LoginStatus.success;
    } else {
      loginModel.loginStatus = LoginStatus.none;
    }

    return loginModel.loginStatus;
  }
}
