import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/application/logic/blocs/home/home_bloc.dart';
import 'package:flutter_application_1/application/present/routes/name.dart';
import 'package:flutter_application_1/application/present/routes/pages.dart';
import 'package:flutter_application_1/service/notification_service.dart';
import 'package:flutter_application_1/shared/custom_assets_loader.dart';
import 'package:flutter_application_1/shared/deb.dart';
import 'package:flutter_application_1/shared/file_downloader.dart';
import 'package:flutter_application_1/support/SupportedLocale.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  // Initialize the file downloader
  final fileDownloader = FileDownloader();

  // Get paths for th.json and en.json
  // final thPath = await fileDownloader.getLocalJsonPath('th.json');
  // final enPath = await fileDownloader.getLocalJsonPath('en.json');

  // Ensure the files exist, download if necessary
  // await ensureFileExists(thPath, 'assets/translations/th.json');
  // await ensureFileExists(enPath, 'assets/translations/en.json');
  // await fileDownloader.downloadAndSaveAll(SupportedLocale.locales);
  List<Locale> locales = [
    const Locale('en', 'US'),
    const Locale('th', 'TH'),
  ];
  await fileDownloader.downloadAndSaveAll(locales);

  // For debugging: check if the files exist and print their content

  // Get the application directory path for localization files
  final localizationPath = (await getApplicationDocumentsDirectory()).path;
  print("Localization path: $localizationPath");

  // Initialize EasyLocalization with the correct path
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    // supportedLocales: const [Locale('en', 'US')],
    supportedLocales: const [Locale('en', 'US'), Locale('th', 'TH')],

    path: localizationPath, // Set to the directory where JSON files are saved
    // path: 'assets/translations',
    assetLoader: CustomAssetLoader(localizationPath),
    // par
    fallbackLocale: const Locale('th', 'TH'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final debugMessage = "Debug info: ${localizationPath}";
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        initialRoute: RoutesName.home,
        routes: RoutesPage.routesAll,
      ),
    );
  }
}

// Ensure a file exists by copying it from the assets if not present
Future<void> ensureFileExists(String filePath, String assetPath) async {
  final file = File(filePath);
  if (!file.existsSync()) {
    print("File $filePath does not exist, copying from assets.");
    final byteData = await rootBundle.load(assetPath);
    await file.writeAsBytes(byteData.buffer.asUint8List());
  } else {
    print("File $filePath already exists.");
  }
}
