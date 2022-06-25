import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'kyc_bloc_event.dart';
part 'kyc_bloc_state.dart';

class KycBlocBloc extends Bloc<KycBlocEvent, KycBlocState> {
  KycBlocBloc() : super(KycBlocInitial()) {
    on<KycBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
