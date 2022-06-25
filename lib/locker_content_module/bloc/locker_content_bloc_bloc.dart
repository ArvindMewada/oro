import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'locker_content_bloc_event.dart';
part 'locker_content_bloc_state.dart';

class LockerContentBlocBloc extends Bloc<LockerContentBlocEvent, LockerContentBlocState> {
  LockerContentBlocBloc() : super(LockerContentBlocInitial()) {
    on<LockerContentBlocEvent>((event, emit) {

    });
  }
}
