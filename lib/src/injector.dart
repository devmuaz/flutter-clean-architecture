import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/utils/constants.dart';
import 'data/datasources/local/app_database.dart';
import 'data/datasources/remote/news_api_service.dart';
import 'data/repositories/articles_repository_impl.dart';
import 'domain/repositories/articles_repository.dart';
import 'domain/usecaes/get_articles_usecase.dart';
import 'domain/usecaes/get_saved_articles_usecase.dart';
import 'domain/usecaes/remove_article_usecase.dart';
import 'domain/usecaes/save_article_usecase.dart';
import 'presentation/blocs/local_articles/local_articles_bloc.dart';
import 'presentation/blocs/remote_articles/remote_articles_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // *
  final database = await $FloorAppDatabase.databaseBuilder(kDatabaseName).build();
  injector.registerSingleton<AppDatabase>(database);

  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<NewsApiService>(NewsApiService(injector()));

  // *
  injector.registerSingleton<ArticlesRepository>(
    ArticlesRepositoryImpl(injector(), injector()),
  );

  // UseCases
  injector.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(injector()));

  // *
  injector.registerSingleton<GetSavedArticlesUseCase>(GetSavedArticlesUseCase(injector()));
  injector.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(injector()));
  injector.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(injector()));

  // Blocs
  injector.registerFactory<RemoteArticlesBloc>(
    () => RemoteArticlesBloc(injector()),
  );

  // *
  injector.registerFactory<LocalArticlesBloc>(
    () => LocalArticlesBloc(injector(), injector(), injector()),
  );
}
