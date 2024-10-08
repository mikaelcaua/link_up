import 'package:flutter/material.dart';
import 'package:link_up/presentation/components/post/list_post_component.dart';
import 'package:link_up/utils/theme/link_up_colors.dart';
import 'package:provider/provider.dart';
import 'package:link_up/controllers/api_controller.dart';
import 'package:link_up/domains/models/post_model.dart';
import 'package:link_up/provider/post_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<PostModel>>posts = ApiController().getFollowersPosts('mik4elll');

  Future<void> refresh() {
    setState(() {
      posts = ApiController().getFollowersPosts('mik4elll');
    });
    return Future.delayed(
      const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LinkUp'),
        backgroundColor: LinkUpColors().AppBarBackGround,
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: FutureBuilder(
          future: posts,
          builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text('Carregado...'));
            } else if (snapshot.hasError) {
              return Center(
                  child: Text('Erro ao carregar dados: ${snapshot.error}'));
            } else {
              Provider.of<Posts>(context, listen: false)
                  .setPosts(snapshot.data!);
              return Consumer<Posts>(
                builder: (context, postsProvider, child) {
                  return ListPostComponent(posts: postsProvider.list);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
