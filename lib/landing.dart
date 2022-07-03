import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/datamodel.dart';
import 'services/auth_service.dart';
import 'services/dataBase.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authenticationProvider = Provider.of<AuthService>(context);
    final dataBaseProvider = Provider.of<DBService>(context);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('AmrikApp'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            onPressed: () {
              authenticationProvider.signOut();
            }
          )
        ],
      ),
      body:
          StreamBuilder(
            stream: dataBaseProvider.getUserProfileDocumentAsStream(authenticationProvider.user.uid),
            builder: (BuildContext context, AsyncSnapshot<User> userSnapShot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Name: ' + userSnapShot.data!.name!),
                  Text(
                      'Date of Birth : ' + userSnapShot.data!.dob!.toString()),
                  Text(
                      'Location : ' + userSnapShot.data!.mapLocation!.toString()),
                  Text(
                      'Rank : ' + userSnapShot.data!.rank!.toString()),
                  Text(
                      'Home Stuff : ' + userSnapShot.data!.homeStuff!.toString()),
                  Text(
                      'Good Guy : ' + userSnapShot.data!.goodGuy!.toString()),
                  Text(
                      'Companies Worked At : ' + userSnapShot.data!.companies!.toString()),
                  Text(
                    '$_counter',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4,
                  ),
                ],
              );
            }
        ),
      );
  }
}