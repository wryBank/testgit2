import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/present/page/home/main.dart';
import 'package:flutter_application_1/application/present/routes/name.dart';

class RoutesPage {
  static const home = HomePage();

  static Map<String, Widget Function(BuildContext)> routesAll = {
    RoutesName.home: (_) => const HomePage(),
  };
}
