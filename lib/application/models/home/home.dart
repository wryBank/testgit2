import 'package:flutter_application_1/data/models/post_model.dart';

class HomeModel {
  String postId;
  int userId;
  String title;
  String body;
  List<PostModel?> postModel;

  HomeModel({required this.postId, required this.userId, required this.title, required this.body, this.postModel = const []});

  HomeModel copyWith({
    String? postId,
    int? userId,
    String? title,
    String? body,
    List<PostModel>? postModel,
  }) {
    return HomeModel(
      postModel: postModel ?? this.postModel,
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  static HomeModel intiial() {
    return HomeModel(postId: '', userId: 0, title: '', body: '');
  }
}
