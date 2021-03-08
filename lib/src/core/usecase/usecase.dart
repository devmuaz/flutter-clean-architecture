abstract class UseCase<T, P> {
  Future<T> call({P params});
}
