import 'package:bloc/bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(CounterState initialState) : super(initialState);

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    final _currentState = state;
    if (event is IncrementEvent) {
      yield CounterState(counter: _currentState.counter + 1);
    } else if (event is DecrementEvent) {
      yield CounterState(counter: _currentState.counter - 1);
    }
  }
}
