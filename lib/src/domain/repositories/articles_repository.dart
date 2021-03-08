import '../../core/params/article_request.dart';
import '../../core/resources/data_state.dart';
import '../entities/article.dart';

abstract class ArticlesRepository {
  // API methods
  Future<DataState<List<Article>>> getBreakingNewsArticles(ArticlesRequestParams params);

  // Database methods
  Future<List<Article>> getSavedArticles();

  Future<void> saveArticle(Article article);

  Future<void> removeArticle(Article article);
}
