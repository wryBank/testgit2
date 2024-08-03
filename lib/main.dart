import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/LocaleKeys/LocaleKeys.dart';
import 'package:flutter_application_1/support/SupportedLocale.dart';

void main() async {
  //test
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: SupportedLocale.locales,
    // supportedLocales: [Locale('en'), Locale('th')],
    path: 'assets/lang',
    fallbackLocale: const Locale('th'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: tr(LocaleKeys.app_title)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextButton(
              child: Text(
                // LocaleKeys.app_title.tr(),
                
                "t",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => setState(() {
                if (context.locale.languageCode == 'en') {
                  context.setLocale(Locale('th'));
                } else {
                  context.setLocale(Locale('en'));
                }
              }),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          // this is from wadisterz

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              // 'You have pushed the button this many times:',
              LocaleKeys.app_title.tr()
              
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
