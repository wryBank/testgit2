abstract class PostRepo {
  Future getPosts({required String postId});
  Future getAllPosts();
}
