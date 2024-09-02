// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/logic/blocs/home/home_event.dart';
import 'package:flutter_application_1/generated/locale_keys.g.dart';
import 'package:flutter_application_1/service/notification_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/application/logic/blocs/home/home_bloc.dart';
import 'package:flutter_application_1/application/models/home/home.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeBloc>().add(onGetAllPost());
    // context.read<HomeBloc>().add(onGetPost("1"));
    super.initState();
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr(LocaleKeys.app_title))),
      // body: BlocBuilder<HomeBloc, HomeModel>(builder: (context, state) {
      //   print(state);
      //   return ListView.builder(
      //     itemCount: state.postModel.length,
      //     itemBuilder: (context, index) {
      //       return ListTile(
      //         title: Text(state.postModel[index]!.title),
      //         subtitle: Text(state.postModel[index]!.body),
      //       );
      //     },
      //   );
      // }),
      body: Column(
        children: [
          Text(tr(LocaleKeys.app_title)),
          Text(counter.toString()),
          ElevatedButton(
            onPressed: () {
              print("a");
              NotificationService.showInstantNotification("Instant Notification", "This shows an instant notifications");
            },
            child: const Text('Show Notification'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              DateTime scheduledDate = DateTime.now().add(const Duration(seconds: 10));
              NotificationService.scheduleNotification(
                0,
                "Scheduled Notification",
                "This notification is scheduled to appear after 5 seconds",
                scheduledDate,
              );
            },
            child: const Text('Schedule Notification'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.read<HomeBloc>().add(onGetAllPost());
          setState(() {
            counter++;
            final newLocale = context.locale == const Locale('en', 'US') ? const Locale('th', 'TH') : const Locale('en', 'US');
            context.setLocale(newLocale);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
