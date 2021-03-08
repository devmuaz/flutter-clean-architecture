part of 'remote_articles_bloc.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<Article> articles;
  final bool noMoreData;

  final DioError error;

  const RemoteArticlesState({this.articles, this.noMoreData, this.error});

  @override
  List<Object> get props => [articles, noMoreData, error];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticlesState {
  const RemoteArticlesDone(List<Article> article, {bool noMoreData}) : super(articles: article, noMoreData: noMoreData);
}

class RemoteArticlesError extends RemoteArticlesState {
  const RemoteArticlesError(DioError error) : super(error: error);
}
