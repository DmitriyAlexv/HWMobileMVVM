import "package:dio/dio.dart";
import "../dio_client.dart";
import "../models/post.dart";

class PostApiSource {
  final DioClient dioClient;

  PostApiSource({required this.dioClient});

  Future<Post> fetchPost(int id) async {
    Response response = await dioClient.dio.get("/posts/$id");
    return Post.fromJson(response.data);
  }

  Future<List<Post>> fetchPosts(int page, int perPage) async {
    final response = await dioClient.dio.get(
      "/posts",
      queryParameters: {"_page": page, "_per_page": perPage},
    );
    return (response.data as List)
        .map((json) => Post.fromJson(json))
        .toList();
  }
}