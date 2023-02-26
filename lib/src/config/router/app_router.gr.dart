// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    BreakingNewsViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const BreakingNewsView(),
      );
    },
    ArticleDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailsViewRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: ArticleDetailsView(
          key: args.key,
          article: args.article,
        ),
      );
    },
    SavedArticlesViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SavedArticlesView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          BreakingNewsViewRoute.name,
          path: '/',
        ),
        RouteConfig(
          ArticleDetailsViewRoute.name,
          path: '/article-details-view',
        ),
        RouteConfig(
          SavedArticlesViewRoute.name,
          path: '/saved-articles-view',
        ),
      ];
}

/// generated route for
/// [BreakingNewsView]
class BreakingNewsViewRoute extends PageRouteInfo<void> {
  const BreakingNewsViewRoute()
      : super(
          BreakingNewsViewRoute.name,
          path: '/',
        );

  static const String name = 'BreakingNewsViewRoute';
}

/// generated route for
/// [ArticleDetailsView]
class ArticleDetailsViewRoute
    extends PageRouteInfo<ArticleDetailsViewRouteArgs> {
  ArticleDetailsViewRoute({
    Key? key,
    required Article article,
  }) : super(
          ArticleDetailsViewRoute.name,
          path: '/article-details-view',
          args: ArticleDetailsViewRouteArgs(
            key: key,
            article: article,
          ),
        );

  static const String name = 'ArticleDetailsViewRoute';
}

class ArticleDetailsViewRouteArgs {
  const ArticleDetailsViewRouteArgs({
    this.key,
    required this.article,
  });

  final Key? key;

  final Article article;

  @override
  String toString() {
    return 'ArticleDetailsViewRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [SavedArticlesView]
class SavedArticlesViewRoute extends PageRouteInfo<void> {
  const SavedArticlesViewRoute()
      : super(
          SavedArticlesViewRoute.name,
          path: '/saved-articles-view',
        );

  static const String name = 'SavedArticlesViewRoute';
}
