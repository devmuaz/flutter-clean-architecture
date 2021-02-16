import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

import '../../domain/entities/article.dart';
import '../../injector.dart';
import '../blocs/local_articles/local_articles_bloc.dart';
import '../widgets/article_widget.dart';

class SavedArticlesView extends HookWidget {
  const SavedArticlesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector<LocalArticlesBloc>()..add(const GetAllSavedArticles()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Ionicons.chevron_back, color: Colors.black),
        ),
      ),
      title: const Text('Saved Articles', style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalArticlesBloc, LocalArticlesState>(
      builder: (context, state) {
        if (state is LocalArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is LocalArticlesDone) {
          return _buildArticlesList(state.articles);
        }
        return Container();
      },
    );
  }

  Widget _buildArticlesList(List<Article> articles) {
    if (articles.isEmpty) {
      return const Center(
          child: Text(
        'NO SAVED ARTICLES',
        style: TextStyle(color: Colors.black),
      ));
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleWidget(
          article: articles[index],
          isRemovable: true,
          onRemove: (article) => _onRemoveArticle(context, article),
          onArticlePressed: (article) => _onArticlePressed(context, article),
        );
      },
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onRemoveArticle(BuildContext context, Article article) {
    BlocProvider.of<LocalArticlesBloc>(context).add(RemoveArticle(article));
  }

  void _onArticlePressed(BuildContext context, Article article) {
    Navigator.pushNamed(context, '/ArticleDetailsView', arguments: article);
  }
}
