import '../../domain/entities/article.dart';
import 'source_model.dart';

class ArticleModel extends Article {
  const ArticleModel({
    int id,
    SourceModel source,
    String author,
    String title,
    String description,
    String url,
    String urlToImage,
    String publishedAt,
    String content,
  }) : super(
          id: id,
          source: source,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return ArticleModel(
      source: SourceModel.fromJson(map['source'] as Map<String, dynamic>),
      author: map['author'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
      urlToImage: map['urlToImage'] as String,
      publishedAt: map['publishedAt'] as String,
      content: map['content'] as String,
    );
  }
}
