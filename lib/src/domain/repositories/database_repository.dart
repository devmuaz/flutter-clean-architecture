import '../models/article.dart';

abstract class DatabaseRepository {
  Future<List<Article>> getSavedArticles();

  Future<void> saveArticle(Article article);

  Future<void> removeArticle(Article article);
}
