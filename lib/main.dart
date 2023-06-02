import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbank_test/src/app.dart';
import 'package:mbank_test/src/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await di.init();

  runApp(const Application());
}

