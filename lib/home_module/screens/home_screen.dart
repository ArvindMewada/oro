import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:oro_sample/home_module/screens/stored_item_screen.dart';
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

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        '')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: appBarHomeScreen(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              topBarView(context),
              SizedBox(
                height: 2.h,
              ),
              homeTitleBarWidget(context, advantageData),
              SizedBox(
                height: 2.h,
              ),
              const DoorStepLocker(),
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
                    const Center(
                        child: Icon(
                      Icons.pause_circle,
                      size: 50,
                      color: Colors.white,
                    )),
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

class DoorStepLocker extends StatelessWidget {
  const DoorStepLocker({
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
