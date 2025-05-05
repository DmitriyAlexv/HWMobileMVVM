import "package:flutter/foundation.dart";
import "../../domain/entities/post.dart";
import "../../domain/usecases/get_post_query.dart";

class PostViewModel extends ChangeNotifier {
  final GetPostQuery getPostQuery;

  PostViewModel({required this.getPostQuery});

  Post? _post;
  bool _isLoading = false;
  String? _error;

  Post? get post => _post;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadPost(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      _post = await getPostQuery(id);
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}