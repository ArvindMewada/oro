import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oro_sample/home_module/bloc/home_bloc_bloc.dart';
import 'package:oro_sample/home_module/bloc/home_bloc_event.dart';
import 'package:oro_sample/home_module/bloc/home_bloc_state.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WhereLockerListBuilderWidget extends StatefulWidget {
  const WhereLockerListBuilderWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<WhereLockerListBuilderWidget> createState() =>
      _WhereLockerListBuilderWidgetState();
}

class _WhereLockerListBuilderWidgetState
    extends State<WhereLockerListBuilderWidget> {
  StoredItemsBloc? _storedItemBloc;

  @override
  void initState() {
    super.initState();
    _loadStoredItem();
  }

  _loadStoredItem() async {
    _storedItemBloc = BlocProvider.of<StoredItemsBloc>(context);
    _storedItemBloc!.add(StoredItemEvents.fetchAlStoredItem);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoredItemsBloc, StoredItemState>(
        bloc: _storedItemBloc,
        builder: (BuildContext context, state) {
          if (state is StoredItemLoading) {
            return SizedBox(
                height: 5.h, child: const CircularProgressIndicator());
          } else if (state is StoredItemListError) {
            final error = state.error;
            String message = "$error ,Tap to Retry.";
            return SizedBox(height: 5.h, child: Text(message));
          } else if (state is StoredItemLoaded) {
            return _listItem(state.storedItem);
          }
          return SizedBox(
              height: 5.h, child: const CircularProgressIndicator());
        });
  }

  Widget _listItem(storeItemList) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      height: 15.h,
      child: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: storeItemList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: SizedBox(
                width: 37.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.fitHeight,
                    imageUrl: storeItemList[index],
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        CircularProgressIndicator(
                            value: downloadProgress.progress),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 24,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
