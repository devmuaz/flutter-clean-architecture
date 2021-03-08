import 'package:flutter_bloc/flutter_bloc.dart';

enum BlocProcessState {
  busy,
  idle,
}

abstract class BlocWithState<E, S> extends Bloc<E, S> {
  BlocWithState(S initialState) : super(initialState);

  BlocProcessState _state = BlocProcessState.idle;

  BlocProcessState get blocProcessState => _state;

  Stream<S> runBlocProcess(Stream<S> Function() process) async* {
    if (_state == BlocProcessState.idle) {
      _state = BlocProcessState.busy;
      yield* process();
      _state = BlocProcessState.idle;
    }
  }
}
