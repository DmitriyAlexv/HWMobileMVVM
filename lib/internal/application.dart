import "package:flutter/material.dart";
import "../presentation/views/home_view.dart";
import "../presentation/views/paginated_post_view.dart";
import "../presentation/views/post_view.dart";

class Application extends StatelessWidget {
  const Application({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MVVM",
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/post": (context) => const PostPage(),
        "/paginated": (context) => const PaginatedPage(),
      },
    );
  }
}