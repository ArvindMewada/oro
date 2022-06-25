part of 'choose_plan_bloc.dart';

@immutable
abstract class ChoosePlanEvent {}

class GetChoosePlanEvent extends ChoosePlanEvent {
  int index;
  BuildContext context;

  GetChoosePlanEvent({required this.index, required this.context});
}
