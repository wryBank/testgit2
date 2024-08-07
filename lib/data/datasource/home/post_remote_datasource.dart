import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/datasource/home/post_path_datasource.dart';
import 'package:flutter_application_1/data/datasource/remote_api.dart';
import 'package:flutter_application_1/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future getPosts({required String postId});
  Future getAllPosts();
}

class PostRemoteDatasourceImpl implements PostRemoteDataSource {
  @override
  Future getPosts({required String postId}) async {
    print("${PostPathDatasource.getPosts}/$postId");
    final Response response = await RemoteApi.getRequest(
      path: "${PostPathDatasource.getPosts}/$postId",
    );
    if (response.statusCode == 200) {
      print(response.data);
      print("200");
      return PostModel.fromJson(response.data);
    } else {
      throw Exception();
    }
  }

  @override
  Future getAllPosts() async {
    // print("${PostPathDatasource.getPosts}/$postId");
    final Response response = await RemoteApi.getRequest(
      path: PostPathDatasource.getPosts,
    );
    if (response.statusCode == 200) {
      print(response.data);
      print("200");
      return List<PostModel>.from(response.data.map((x) => PostModel.fromJson(x)));
    } else {
      throw Exception();
    }
  }
}
