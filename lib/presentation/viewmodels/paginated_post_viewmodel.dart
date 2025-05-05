import "package:flutter/foundation.dart";
import "package:mvvm/domain/entities/post.dart";
import "package:mvvm/domain/usecases/get_posts_query.dart";

class PaginatedPostViewmodel extends ChangeNotifier {
  final GetPostsQuery getPostsQuery;

  PaginatedPostViewmodel({required this.getPostsQuery});

  List<Post> _posts = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  String? _error;

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;
  String? get error => _error;

  Future<void> loadNextPage() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    notifyListeners();

    try {
      final newPosts = await getPostsQuery(_currentPage, 10);
      if (newPosts.isEmpty) {
        _hasMore = false;
      } else {
        _posts.addAll(newPosts);
        _currentPage++;
      }
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}