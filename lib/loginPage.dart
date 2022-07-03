import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'landing.dart';
import 'main.dart';
import '/services/auth_service.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, AuthService _auth, _) {
      switch (_auth.status) {
        case Status.Uninitialized:
          return Scaffold(
            appBar: AppBar(
              title: Text('AmrikApp'),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SignInButton(
                    Buttons.Google,
                    onPressed: () async {await _auth.signInWithGoogle();},
                  ), //SignInButton
                ]),
            ),
          );
        case Status.Unauthenticated:
          return Scaffold(
            appBar: AppBar(
              title: Text('Amrik App'
                  ''),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Image.asset(),
                  SignInButton(
                    Buttons.Google,
                    padding: EdgeInsets.all(10.0),
                    onPressed: () async {
                      await _auth.signInWithGoogle();
                    },
                  ), // SignInButton
                  Padding(padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
                  child:Text("Sign Up Demo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)))

                ])));
        case Status.Authenticating:
          return CircularProgressIndicator();
        case Status.Authenticated:
          return LandingPage();
        default: return LoginPage();
      }
  });
}
}