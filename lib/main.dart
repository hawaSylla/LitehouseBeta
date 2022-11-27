import 'package:flutter/material.dart';
import 'package:litehouse_app/screens/auth_screen.dart';
import 'package:litehouse_app/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  //initilization of Firebase app

  // other Firebase service initialization

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiteHouseChat',
      theme: ThemeData.from(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.amber,
        // backgroundColor: Colors.amber,
        // accentColor: Colors.indigo,
        // accentColorBrightness: Brightness.dark,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.amber,
          onPrimary: Colors.white,
          secondary: Colors.indigo,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.black,
          background: Colors.amber,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black26,
        ),
        // buttonTheme: ButtonTheme.of(context).copyWith(
        //     buttonColor: Colors.indigo,
        //     textTheme: ButtonTextTheme.primary,
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(20))),
        // ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      home: AuthScreen(),
    );
  }
}
