import 'package:flutter/material.dart';
import 'package:flutter_example02/login/service/login_service.dart';
import 'package:provider/provider.dart';

import '../main_router.dart';
import 'model/login_model.dart';

class LoginView extends StatelessWidget {
  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final idFieldController = TextEditingController();
    final idField = TextField(
      controller: idFieldController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "ID",
          hintText: "Enter your ID.",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordFieldController = TextEditingController();
    final passwordField = TextField(
      controller: passwordFieldController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Password",
          hintText: "Enter your password.",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
      child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: SizedBox(
            width: 400.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 65.0),
                idField,
                SizedBox(height: 15.0),
                passwordField,
                SizedBox(
                  height: 25.0,
                ),
                Consumer<LoginModel>(
                    builder: (context, model, child) => model.loginStatus == LoginStatus.in_progress
                        ? CircularProgressIndicator()
                        : Material(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Color(0xff3030ff),
                            child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              onPressed: () async {
                                var status = await Provider.of<LoginService>(context, listen: false)
                                    .handleLogin(idFieldController.text, passwordFieldController.text);

                                if (status == LoginStatus.success) {
                                  // remove all views but Home.
                                  Navigator.of(context)
                                      .pushNamedAndRemoveUntil(RoutePaths.Home, (Route<dynamic> route) => false);
                                }
                              },
                              child: Text("User Login",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                          )),
              ],
            ),
          )),
    )));
  }
}
