import "package:flutter/material.dart";
import "package:mvvm/presentation/viewmodels/paginated_post_viewmodel.dart";
import "package:provider/provider.dart";

class PaginatedPage extends StatefulWidget {
  const PaginatedPage({super.key});

  @override
  _PaginatedPageState createState() => _PaginatedPageState();
}

class _PaginatedPageState extends State<PaginatedPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PaginatedPostViewmodel>(context, listen: false).loadNextPage();
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      Provider.of<PaginatedPostViewmodel>(context, listen: false).loadNextPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PaginatedPostViewmodel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Paginated Posts")),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: viewModel.posts.length + (viewModel.hasMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= viewModel.posts.length) {
            return const Center(child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ));
          }
          final post = viewModel.posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
          );
        },
      ),
    );
  }
}