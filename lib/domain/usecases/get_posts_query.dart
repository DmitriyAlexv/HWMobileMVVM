import "../entities/post.dart";
import "../repositories/i_post_repository.dart";

class GetPostsQuery {
  final IPostRepository repository;

  GetPostsQuery({required this.repository});

  Future<List<Post>> call(int page, int perPage) async =>
      await repository.getPosts(page, perPage);
}