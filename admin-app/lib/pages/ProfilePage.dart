import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:provider/provider.dart';
import '../providers/Profiles.dart';
import '../components/headers/DefaultHeader.dart';

class ProfilePage extends StatelessWidget {
  final String userId;

  ProfilePage(this.userId);

  Future<void> _getProfile(BuildContext context) async {
    await Provider.of<Profiles>(context, listen: false)
        .getOrFetchProfile(userId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getProfile(context),
        builder: (ctx, profileSnap) {
          if (profileSnap.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<Profiles>(builder: (ctx, profileData, child) {
              var profile = profileData.profiles[userId];
              return Scaffold(
                appBar: DefaultHeader(
                  appBar: AppBar(),
                  profile: profile,
                  signOut: () => FirebaseAuth.instance.signOut(),
                ),
                body: Center(
                  child: Text(profile.email),
                ),
              );
            });
          }
        });
  }
}
