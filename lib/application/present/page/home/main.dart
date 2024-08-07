// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/logic/blocs/home/home_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/application/logic/blocs/home/home_bloc.dart';
import 'package:flutter_application_1/application/models/home/home.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
      ),
      body: BlocBuilder<HomeBloc, HomeModel>(builder: (context, state) {
        print(state);
        return ListView.builder(
          itemCount: state.postModel.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.postModel[index]!.title),
              subtitle: Text(state.postModel[index]!.body),
            );
          },
        );
      }),
    );
  }
}
