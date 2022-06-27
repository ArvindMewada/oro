

import 'dart:io';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oro_sample/home_module/bloc/home_bloc_event.dart';
import 'package:oro_sample/home_module/bloc/home_bloc_state.dart';
import 'package:oro_sample/home_module/bloc/storedItemError.dart';
import 'package:oro_sample/home_module/data_model/stored_item.dart';
import 'package:oro_sample/home_module/repository/home_screen_repository.dart';

class StoredItemsBloc extends Bloc<StoredItemEvents, StoredItemState> {
  late StoredItemRepo storedItemRepo;
  late List<dynamic> storedItem;
  StoredItemState get initialState => StoredItemInitState();

  StoredItemsBloc({required this.storedItemRepo}) : super(StoredItemInitState());

    @override
  Stream<StoredItemState> mapEventToState(StoredItemEvents event) async* {
      switch (event) {
        case StoredItemEvents.fetchAlStoredItem:
          yield StoredItemLoading();
          try {
            storedItem = await storedItemRepo.getStoredItemList();
            yield StoredItemLoaded(storedItem: storedItem);
          } on SocketException {
            yield StoredItemListError(
              error: NoInternetException('No Internet'),
            );
          } on HttpException {
            yield StoredItemListError(
              error: NoServiceFoundException('No Service Found'),
            );
          } on FormatException {
            yield StoredItemListError(
              error: InvalidFormatException('Invalid Response format'),
            );
          } catch (e) {
            yield StoredItemListError(
              error: UnknownException('Unknown Error'),
            );
          }break;
      }
    }

  }

