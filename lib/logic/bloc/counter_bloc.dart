import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(int savedValue)
      : super(CounterState(counterValue: savedValue, wasIncremented: false)) {
    on<CounterEvent>((event, emit) async {
      if (event is Increment) {
        emit(CounterState(
          counterValue: state.counterValue + 1,
          wasIncremented: true,
        ));
      }
      if (event is Decrement) {
        emit(CounterState(
            counterValue: state.counterValue - 1, wasIncremented: false));
      }
    });
  }
}
