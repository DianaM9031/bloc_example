import 'package:bloc/bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(CounterState initialState) : super(initialState);

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
