import 'package:bravoo/src/bravoo_app.dart';
import 'package:bravoo/src/setup_main.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupMain();
  runApp(const BravooApp());
}
