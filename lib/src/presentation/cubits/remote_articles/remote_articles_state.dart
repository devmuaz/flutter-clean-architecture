part of 'remote_articles_cubit.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<Article> articles;
  final bool noMoreData;
  final DioError? error;

  const RemoteArticlesState({
    this.articles = const [],
    this.noMoreData = true,
    this.error,
  });

  @override
  List<Object?> get props => [articles, noMoreData, error];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

class RemoteArticlesSuccess extends RemoteArticlesState {
  const RemoteArticlesSuccess({super.articles, super.noMoreData});
}

class RemoteArticlesFailed extends RemoteArticlesState {
  const RemoteArticlesFailed({super.error});
}
