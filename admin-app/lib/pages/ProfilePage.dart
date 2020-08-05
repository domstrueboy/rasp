import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/Profiles.dart';

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
            print(profileSnap);
            return Scaffold(
              appBar: AppBar(
                title: Text('Profile'),
                actions: [],
              ),
              body: Center(
                child: Consumer<Profiles>(
                  builder: (ctx, profileData, child) => Text(profileData == null
                      ? 'Loading'
                      : profileData.profiles[userId].title),
                ),
              ),
            );
          }
        });
  }
}
