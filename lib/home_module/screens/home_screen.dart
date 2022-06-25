import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '/home_module/widgets/home_widget.dart';
import '/utils/common_file.dart';
import '/utils/image_assets_file.dart';
import '/utils/string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
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
              Container(
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
              ),
              homeTitleBarWidget(
                context,
                lockerSpace,
              ),
              Container(
                height: 18.h,
                margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: Center(
                  child: Image.asset(
                    vectorImage,
                    height: 7.h,
                    width: 7.w,
                  ),
                ),
              ),
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
}
