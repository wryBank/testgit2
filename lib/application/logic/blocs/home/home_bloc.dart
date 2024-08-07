import 'package:flutter_application_1/application/logic/blocs/home/home_event.dart';
import 'package:flutter_application_1/application/models/home/home.dart';
import 'package:flutter_application_1/data/datasource/home/post_remote_datasource.dart';
import 'package:flutter_application_1/data/models/post_model.dart';
import 'package:flutter_application_1/data/repo/post_repo_impl.dart';
import 'package:flutter_application_1/domain/repo/post_repo.dart';
import 'package:flutter_application_1/shared/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeModel> {
  HomeBloc() : super(HomeModel.intiial()) {
    on<onGetPost>((event, emit) async {
      // print(event.postId);
      final postRepo = PostRepoImpl(postRemoteDataSource: PostRemoteDatasourceImpl());
      final response = await postRepo.getPosts(postId: event.postId!);
      response.fold((l) {}, (r) {
        print("aa {$r}");
        print("state.copywith ${state.copyWith(postModel: [r])}");
        print("postModel ${r.title}");
        emit(state.copyWith(postModel: [r]));
      });
    });
    on<onGetAllPost>((event, emit) async {
      print("onGetAllPost");
      final postRepo = PostRepoImpl(postRemoteDataSource: PostRemoteDatasourceImpl());
      final response = await postRepo.getAllPosts();
      response.fold((l) {}, (r) {
        print("aa {$r}");
        print("state.copywith ${state.copyWith(postModel: r)}");
        // print("postModel ${r.title}");
        emit(state.copyWith(postModel: r));
      });
    });
  }
}
