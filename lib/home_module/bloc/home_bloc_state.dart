import 'package:equatable/equatable.dart';
import 'package:oro_sample/home_module/data_model/safe_secur_item.dart';
import 'package:oro_sample/home_module/data_model/stored_item.dart';

abstract class StoredItemState extends Equatable {

}

class StoredItemInitState extends StoredItemState {
  @override
  List<Object> get props => [];
}

class StoredItemLoading extends StoredItemState {
  @override
  List<Object> get props => [];
}

class StoredItemLoaded extends StoredItemState {
  final List<dynamic> storedItem;

  StoredItemLoaded({required this.storedItem});
  @override
  // TODO: implement props
  List<Object?> get props => [storedItem];
}

class StoredItemListError extends StoredItemState {
  final error;

  StoredItemListError({this.error});
  @override
  List<Object> get props => [];
}



abstract class SafeAndSecureItemState extends Equatable {
  @override
  List<Object> get props => [];
}

class SafeAndSecureItemInitState extends SafeAndSecureItemState {}

class SafeAndSecureItemLoading extends SafeAndSecureItemState {}

class SafeAndSecureItemLoaded extends SafeAndSecureItemState {
  final List<SafeAndSecureDataModel> safeAndSecureItem;

  SafeAndSecureItemLoaded({required this.safeAndSecureItem});
}

class SafeAndSecureItemListError extends SafeAndSecureItemState {
  final error;

  SafeAndSecureItemListError({this.error});
}
