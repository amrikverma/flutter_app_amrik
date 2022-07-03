import 'package:flutter/material.dart';
import 'package:flutter_app_amrik/services/auth_service.dart';
import 'package:flutter_app_amrik/services/dataBase.dart';
import 'loginPage.dart';
import 'package:provider/provider.dart';
import 'services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider (create: (context) => AuthService.instance()),
        Provider(create: (context) => DBService()),
      ],
        child:
        MaterialApp(
          title: 'Amrik App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginPage(),
        ),
      );
  }
}


