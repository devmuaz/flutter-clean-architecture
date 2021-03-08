import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../core/bloc/bloc_with_state.dart';
import '../../../core/params/article_request.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/entities/article.dart';
import '../../../domain/usecaes/get_articles_usecase.dart';

part 'remote_articles_event.dart';
part 'remote_articles_state.dart';

class RemoteArticlesBloc extends BlocWithState<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticlesUseCase _getArticlesUseCase;

  RemoteArticlesBloc(this._getArticlesUseCase) : super(const RemoteArticlesLoading());

  final List<Article> _articles = [];
  int _page = 1;
  static const int _pageSize = 20;

  @override
  Stream<RemoteArticlesState> mapEventToState(RemoteArticlesEvent event) async* {
    if (event is GetArticles) yield* _getBreakingNewsArticle(event);
  }

  Stream<RemoteArticlesState> _getBreakingNewsArticle(RemoteArticlesEvent event) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _getArticlesUseCase(params: ArticlesRequestParams(page: _page));

      if (dataState is DataSuccess && dataState.data.isNotEmpty) {
        final articles = dataState.data;
        final noMoreData = articles.length < _pageSize;
        _articles.addAll(articles);
        _page++;

        yield RemoteArticlesDone(_articles, noMoreData: noMoreData);
      }
      if (dataState is DataFailed) {
        yield RemoteArticlesError(dataState.error);
      }
    });
  }
}
