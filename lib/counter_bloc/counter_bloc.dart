import 'package:bloc_training_app/counter_bloc/counter_event.dart';
import 'package:bloc_training_app/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CounterBloc extends Bloc<CounterEvent, CounterState>{

  CounterBloc() : super(CounterState(0));


  @override
  Stream<CounterState> mapEventToState(event) async*{

   if (event is AddCounter){
      yield CounterState(state.counter + 1);
   } else if (event is SubCounter) {
     yield CounterState(state.counter -1);
   }
  }
}