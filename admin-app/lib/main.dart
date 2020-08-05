import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import './providers/Profiles.dart';

import './pages/AuthPage.dart';
import './pages/ProfilePage.dart';
import './pages/SplashPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Profiles>(
          create: (ctx) => Profiles(),
        ),
      ],
      child: MaterialApp(
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
          builder: (ctx, userSnap) {
            if (userSnap.connectionState == ConnectionState.waiting) {
              return SplashPage();
            }
            if (userSnap.hasData) return ProfilePage(userSnap.data.uid);
            return AuthPage();
          },
        ),
      ),
    );
  }
}
