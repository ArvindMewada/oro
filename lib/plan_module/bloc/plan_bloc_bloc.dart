import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'plan_bloc_event.dart';
part 'plan_bloc_state.dart';

class PlanBlocBloc extends Bloc<PlanBlocEvent, PlanBlocState> {
  PlanBlocBloc() : super(PlanBlocInitial()) {
    on<PlanBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
