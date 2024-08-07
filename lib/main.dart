import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/logic/blocs/home/home_bloc.dart';
import 'package:flutter_application_1/application/present/routes/name.dart';
import 'package:flutter_application_1/application/present/routes/pages.dart';
import 'package:flutter_application_1/shared/navigation_service.dart';
import 'package:flutter_application_1/support/SupportedLocale.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  //test
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: SupportedLocale.locales,
    // supportedLocales: [Locale('en'), Locale('th')],
    path: 'assets/translations',
    fallbackLocale: const Locale('th'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        initialRoute: RoutesName.home,
        routes: RoutesPage.routesAll,
      ),
    );
  }
}
