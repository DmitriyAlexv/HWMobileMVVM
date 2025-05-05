import "package:flutter/material.dart";
import "package:mvvm/data/api/post_api_source.dart";
import "package:mvvm/internal/application.dart";
import "package:mvvm/presentation/viewmodels/paginated_post_viewmodel.dart";
import "package:provider/provider.dart";
import "../data/dio_client.dart";
import "../data/repositories/post_repository.dart";
import "../domain/usecases/get_post_query.dart";
import "../presentation/viewmodels/post_viewmodel.dart";
import "domain/usecases/get_posts_query.dart";

void main() {
  final dioClient = DioClient();

  final postApiSource = PostApiSource(dioClient: dioClient);
  final postRepository = PostRepository(postApiSource: postApiSource);

  final getPostQuery = GetPostQuery(repository: postRepository);
  final postViewModel = PostViewModel(getPostQuery: getPostQuery);

  final getPostsQuery = GetPostsQuery(repository: postRepository);
  final paginatedPostViewModel = PaginatedPostViewmodel(getPostsQuery: getPostsQuery);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => postViewModel),
        ChangeNotifierProvider(create: (_) => paginatedPostViewModel),
      ],
      child: const Application(),
    ),
  );
}

