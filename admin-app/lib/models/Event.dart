import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Event {
  final String title;
  final DateTime from;
  final DateTime till;

  Event({
    @required this.title,
    @required this.from,
    @required this.till,
  });
}
