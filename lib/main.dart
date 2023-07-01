import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_lunapp/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const LunApp());
}
