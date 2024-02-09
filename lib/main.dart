import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharaohs_gold_app/pharaohs_gold_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(PharaohsGoldApp());
}
