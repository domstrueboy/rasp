import 'package:flutter/material.dart';

import '../../models/Profile.dart';

class DefaultHeader extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final Profile profile;
  final Function signOut;

  DefaultHeader({this.appBar, this.profile, this.signOut});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        backgroundImage:
            profile.imageUrl == null ? null : NetworkImage(profile.imageUrl),
        child: profile.imageUrl == null ? Text(profile.email) : null,
      ),
      title: profile.title == null ? Text(profile.email) : Text(profile.title),
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
              signOut();
            }
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
