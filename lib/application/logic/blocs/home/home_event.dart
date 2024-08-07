import 'package:flutter_application_1/application/logic/blocs/app_bloc.dart';

abstract class HomeEvent extends AppEvent {}

class onGetPost extends HomeEvent {
  final String? postId;
  onGetPost(this.postId);
}

class onGetAllPost extends HomeEvent {}
