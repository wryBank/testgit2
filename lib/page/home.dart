import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/locale_keys.g.dart';


class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
        appBar: AppBar(
          title: Text("s"),
        ),
        body: Center(
          child: Text(tr(LocaleKeys.app_title)),
        ));
  }
}
