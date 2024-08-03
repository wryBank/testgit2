import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home.dart';
import 'package:flutter_application_1/routes/name.dart';

class RoutesPage{
  static const home = homePage();


  static Map<String, Widget Function(BuildContext)> routesAll = {
    RoutesName.home: (_) => homePage(),
  };
}
