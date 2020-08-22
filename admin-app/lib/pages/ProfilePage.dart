import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:provider/provider.dart';
import '../providers/Profiles.dart';
import '../models/Profile.dart';

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
                appBar: AppBar(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: profile.imageUrl == null
                        ? null
                        : NetworkImage(profile.imageUrl),
                    child:
                        profile.imageUrl == null ? Text(profile.email) : null,
                  ),
                  title: Text(profile.email),
                  actions: [
                    DropdownButton(
                      underline: Container(),
                      icon: Icon(
                        Icons.more_vert,
                        color: Theme.of(context).primaryIconTheme.color,
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Container(
                            child: Row(
                              children: [
                                Icon(Icons.exit_to_app),
                                SizedBox(width: 12),
                                Text('Logout'),
                              ],
                            ),
                          ),
                          value: 'logout',
                        )
                      ],
                      onChanged: (itemIdentifier) {
                        if (itemIdentifier == 'logout') {
                          FirebaseAuth.instance.signOut();
                        }
                      },
                    )
                  ],
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
