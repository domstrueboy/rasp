import 'package:flutter/foundation.dart';

class Profile {
  final String email;
  final String title;
  final String imageUrl;

  Profile({
    @required this.email,
    this.title,
    this.imageUrl,
  });
}
