import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './pages/AuthPage.dart';
import './pages/ChatPage.dart';
import './pages/SplashPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rasp',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          backgroundColor: Colors.pink,
          accentColor: Colors.indigoAccent,
          accentColorBrightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonTheme: ButtonTheme.of(context).copyWith(
            buttonColor: Colors.pink,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          )),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return SplashPage();
          }
          if (userSnapshot.hasData) return ChatPage();
          return AuthPage();
        },
      ),
    );
  }
}
