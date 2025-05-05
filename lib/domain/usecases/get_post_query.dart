import "../entities/post.dart";
import "../repositories/i_post_repository.dart";

class GetPostQuery {
  final IPostRepository repository;

  GetPostQuery({required this.repository});

  Future<Post> call(int id) async => await repository.getPost(id);
}