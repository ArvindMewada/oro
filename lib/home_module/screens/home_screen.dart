import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oro_sample/home_module/screens/stored_item_screen.dart';
import 'package:oro_sample/kyc_module/screens/kyc_full_screen_dialog.dart';
import 'package:oro_sample/utils/color_theme.dart';
import 'package:oro_sample/utils/image_assets_file.dart';
import 'package:oro_sample/utils/network.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

import '/home_module/widgets/home_widget.dart';
import '/utils/common_file.dart';
import '/utils/string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VideoPlayerController? _controller;
  String dropdownValue = 'English';

  var itemsValueLanguageList = [
    'English',
    'Tamil',
    'Hindi',
  ];

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: appBarHomeScreenWidget(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              currentDorrStpeTopBarViewWidget(context),
              SizedBox(
                height: 2.h,
              ),
              homeTitleBarWidget(context, advantageData),
              SizedBox(
                height: 2.h,
              ),
              const DoorStepLockerWidgets(),
              homeTitleBarWidget(
                context,
                lockerSpace,
              ),
              lockerSpaceVideoWidget(),
              homeTitleBarWidget(context, whereAreLocker),
              const WhereLockerListBuilderWidget(),
              homeTitleBarWidget(context, safeAndSecure),
              bottomBarImageWidget(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appBarHomeScreenWidget(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.menu),
      automaticallyImplyLeading: true,
      centerTitle: true,
      backgroundColor: Colors.grey[100],
      iconTheme: const IconThemeData(color: Colors.black),
      title: Container(
        margin: const EdgeInsets.only(top: 8),
        child: Image.asset(
          appIcon,
          height: 14.h,
          width: 14.w,
        ),
      ),
      elevation: 0,
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            kycDialogOpenWidget(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: const [
                Icon(
                  Icons.location_on,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  eKyc,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  kycDialogOpenWidget(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext contx) {
          return Dialog(
            elevation: 8,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
              height: MediaQuery.of(contx).size.height,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            kycHeader,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 3.h,
                            width: 14.w,
                            decoration: BoxDecoration(
                              color: const Color(yellowApp),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 2),
                              child: StatefulBuilder(builder:
                                  (BuildContext context,
                                      StateSetter dropDownState) {
                                return DropdownButton<String>(
                                  value: dropdownValue,
                                  elevation: 0,
                                  enableFeedback: true,
                                  isDense: false,
                                  underline: const SizedBox(),
                                  iconSize: 24,
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                  icon: const Icon(
                                    Icons.language,
                                    size: 14,
                                    color: Colors.black,
                                  ),
                                  items: <String>[
                                    'English',
                                    'Hindi',
                                    'Tamil',
                                    'Kannada'
                                  ].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    dropDownState(() {
                                      setState(() {
                                        dropdownValue = value.toString();
                                        context.read<Counter>().increment();
                                      });
                                    });
                                  },
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      readKyc,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 1,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.h,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade400,
                              width: 14,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4))),
                        child: KycFullScreenDialog(
                          language: dropdownValue,
                        )),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              decoration: BoxDecoration(
                                color: const Color(yellowApp),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                cancelButton,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              decoration: BoxDecoration(
                                color: const Color(0xffFFE1A8),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                confirmButtonKyc,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget lockerSpaceVideoWidget() {
    return Container(
      height: 18.h,
      margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          setState(() {
            _controller!.value.isPlaying
                ? _controller!.pause()
                : _controller!.play();
          });
        },
        child: _controller!.value.isInitialized
            ? Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    ),
                  ),
                  if (!_controller!.value.isPlaying)
                    Container(
                      height: 10,
                      margin: const EdgeInsets.all(60),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4)),
                      child: const Icon(
                        Icons.play_arrow_outlined,
                        color: Colors.white,
                      ),
                    )
                ],
              )
            : SizedBox(
                height: 5.h,
                width: 5.h,
                child: const CircularProgressIndicator()),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}


class DoorStepLockerWidgets extends StatelessWidget {
  const DoorStepLockerWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: const Center(
          child: Text(doorStep,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 13,
                  fontWeight: FontWeight.w400))),
    );
  }
}

class Counter with ChangeNotifier{
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

}
