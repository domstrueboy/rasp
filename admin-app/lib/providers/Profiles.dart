import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/Profile.dart';

class Profiles with ChangeNotifier {
  Map<String, Profile> _profiles = {};

  Map<String, Profile> get profiles {
    return {..._profiles};
  }

  Future<Profile> getOrFetchProfile(String uid) async {
    if (_profiles[uid] == null) {
      final profileData =
          await Firestore.instance.collection('users').document(uid).get();
      _profiles[uid] = Profile(
        email: profileData['email'],
        title: profileData['title'],
        imageUrl: profileData['imageUrl'],
      );
    }
    notifyListeners();
    return _profiles[uid];
  }
}
