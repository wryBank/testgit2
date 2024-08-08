import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/datasource/home/post_path_datasource.dart';
import 'package:flutter_application_1/data/datasource/home/post_remote_datasource.dart';
import 'package:flutter_application_1/data/models/ErrorResponseModel.dart';
import 'package:flutter_application_1/data/models/post_model.dart';
import 'package:flutter_application_1/domain/entities/post_entities.dart';
import 'package:flutter_application_1/domain/repo/post_repo.dart';

class PostRepoImpl implements PostRepo {
  final PostRemoteDataSource postRemoteDataSource;

  PostRepoImpl({required this.postRemoteDataSource});

  @override
  Future<Either<ErrorResponseModel, PostModel>> getPosts({required String postId}) async {
    try {
      PostModel response = await postRemoteDataSource.getPosts(postId: postId);
      print("response");
      print(response);
      return Right(response);
    } on DioException catch (e) {
      var errorResponseModel = ErrorResponseModel(
        path: e.response?.data['path'],
        message: e.response?.data['message'],
        timestamp: e.response?.data['timestamp'],
        statusCode: e.response?.statusCode,
      );
      return Left(errorResponseModel);
    }
  }

  @override
  Future<Either<ErrorResponseModel, List<PostModel>>> getAllPosts() async {
    try {
      List<PostModel> response = await postRemoteDataSource.getAllPosts();
      print("response");
      print(response);
      return Right(response);
    } on DioException catch (e) {
      var errorResponseModel = ErrorResponseModel(
        path: e.response?.data['path'],
        message: e.response?.data['message'],
        timestamp: e.response?.data['timestamp'],
        statusCode: e.response?.statusCode,
      );
      return Left(errorResponseModel);
    }
  }
}
