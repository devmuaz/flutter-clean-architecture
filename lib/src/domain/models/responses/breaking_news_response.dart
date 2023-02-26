import 'package:equatable/equatable.dart';

import '../article.dart';

class BreakingNewsResponse extends Equatable {
  final String status;
  final int totalResults;
  final List<Article> articles;

  BreakingNewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory BreakingNewsResponse.fromMap(Map<String, dynamic> map) {
    return BreakingNewsResponse(
      status: (map['status'] ?? '') as String,
      totalResults: (map['totalResults'] ?? 0) as int,
      articles: List<Article>.from(
        map['articles'].map<Article>(
          (x) => Article.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, totalResults, articles];
}
