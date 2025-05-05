import "../entities/post.dart";

abstract class IPostRepository {
  Future<Post> getPost(int id);
  Future<List<Post>> getPosts(int page, int perPage);
}