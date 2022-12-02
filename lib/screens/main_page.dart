import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_screen.dart';
import 'chat_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((BuildContext context, userSnapshot) {
            if (userSnapshot.hasData) {
              return ChatScreen();
            } else {
              return const AuthScreen();
            }
          })),
    );
  }
}
