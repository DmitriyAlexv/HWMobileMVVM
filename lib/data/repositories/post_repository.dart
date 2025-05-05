import "../../domain/entities/post.dart";
import "../../domain/repositories/i_post_repository.dart";
import "../api/post_api_source.dart";

class PostRepository implements IPostRepository {
  final PostApiSource postApiSource;

  PostRepository({required this.postApiSource});

  @override
  Future<Post> getPost(int id) async {
    final post = await postApiSource.fetchPost(id);
    return Post(
      userId: post.userId,
      id: post.id,
      title: post.title,
      body: post.body,
    );
  }

  @override
  Future<List<Post>> getPosts(int page, int perPage) async {
    final posts = await postApiSource.fetchPosts(page, perPage);
    return posts
        .map(
          (post) => Post(
            userId: post.userId,
            id: post.id,
            title: post.title,
            body: post.body,
          ),
        )
        .toList();
  }
}
