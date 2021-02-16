import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/article.dart';
import '../../../domain/usecaes/get_saved_articles_usecase.dart';
import '../../../domain/usecaes/remove_article_usecase.dart';
import '../../../domain/usecaes/save_article_usecase.dart';

part 'local_articles_event.dart';
part 'local_articles_state.dart';

class LocalArticlesBloc extends Bloc<LocalArticlesEvent, LocalArticlesState> {
  final GetSavedArticlesUseCase _getSavedArticlesUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticlesBloc(
    this._getSavedArticlesUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticlesLoading());

  @override
  Stream<LocalArticlesState> mapEventToState(LocalArticlesEvent event) async* {
    if (event is GetAllSavedArticles) {
      yield* _getAllSavedArticles();
    }
    if (event is RemoveArticle) {
      await _removeArticleUseCase(params: event.article);
      yield* _getAllSavedArticles();
    }
    if (event is SaveArticle) {
      await _saveArticleUseCase(params: event.article);
      yield* _getAllSavedArticles();
    }
  }

  Stream<LocalArticlesState> _getAllSavedArticles() async* {
    final articles = await _getSavedArticlesUseCase();
    yield LocalArticlesDone(articles);
  }
}
