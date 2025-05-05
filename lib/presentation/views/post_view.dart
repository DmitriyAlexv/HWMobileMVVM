import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../viewmodels/post_viewmodel.dart";

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PostViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Post Details")),
      body: Center(
        child: viewModel.isLoading ?
            const CircularProgressIndicator() :
            viewModel.error != null ?
              Text("Error: ${viewModel.error}"):
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(viewModel.post?.title ?? "No title"),
                Text(viewModel.post?.body ?? "No body"),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.loadPost(1),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}