part of 'choose_plan_bloc.dart';

@immutable
abstract class ChoosePlanState {}

class ChoosePlanInitial extends ChoosePlanState {}

class ChoosePlanLoading extends ChoosePlanState {
  List<ChoosePlanModel> choosePlanModel;

  ChoosePlanLoading({required this.choosePlanModel});
}

class ChoosePlanLoaded extends ChoosePlanState {
  List<ChoosePlanModel> choosePlanModel;

  ChoosePlanLoaded({required this.choosePlanModel});
}

class ChoosePlanError extends ChoosePlanState {}
