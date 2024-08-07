import 'package:flutter_application_1/domain/repo/post_repo.dart';

class PostUsecase {
  final PostRepo _postRepository;

  PostUsecase(this._postRepository);

  Future getPost(String postId) async {
    await _postRepository.getPosts(postId: postId);
  }

  Future getAllPost(String postId) async {
    await _postRepository.getAllPosts();
  }
}
