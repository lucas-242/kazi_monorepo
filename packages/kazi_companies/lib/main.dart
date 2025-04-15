import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kazi_companies/app.dart';
import 'package:kazi_companies/core/environments/environment.dart';
import 'package:kazi_companies/injection_container.dart';
import 'package:kazi_core/kazi_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  // setUrlStrategy(PathUrlStrategy());

  InjectionContainer.init();
  Log.flow('Environment: ${Environment.environmentValue}');

  return runApp(const App());
}
