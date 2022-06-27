import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '/kyc_module/screens/kyc_full_screen_dialog.dart';
import '/locker_content_module/screens/locker_content_screen.dart';
import '/utils/color_theme.dart';
import '/utils/common_file.dart';
import '/utils/image_assets_file.dart';
import '/utils/string.dart';

Widget bottomBarImageWidget() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16),
    width: double.infinity,
    height: 10.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            appIcon,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 2,
          child: Image.asset(
            godRej,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 2,
          child: Image.asset(
            countryImage,
          ),
        ),
      ],
    ),
  );
}

Widget homeTitleBarWidget(BuildContext context, String titleValue) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            titleValue,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          flex: 1,
          child: Image.asset(
            oroLineImage,
          ),
        ),
      ],
    ),
  );
}

Widget currentDorrStpeTopBarViewWidget(BuildContext context) {
  return Container(
    height: 23.h,
    padding: const EdgeInsets.all(16),
    width: double.infinity,
    color: Colors.white,
    child: Row(
      children: [
        const LeftTopKycVerticalWidget(),
        SizedBox(
          width: 5.w,
        ),
        rightTopKycFullWidget(context),
      ],
    ),
  );
}

Widget rightTopKycFullWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(currentDoorStep,
          style: TextStyle(
              color: Colors.grey[500],
              fontSize: 14.sp,
              fontWeight: FontWeight.w400)),
      const SizedBox(
        height: 16,
      ),
      Text(
        locker,
        style: TextStyle(
            color: Colors.black87,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700),
      ),
      const SizedBox(
        height: 3,
      ),
      Text(weWillShortly,
          style: TextStyle(
              color: Colors.grey[500],
              fontSize: 15.sp,
              fontWeight: FontWeight.w400)),
      Container(
        margin: EdgeInsets.symmetric(vertical: 6.w),
        width: 69.w,
        height: 4.h,
        // padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow.shade400, const Color(0xffF8B830)],
            ),
            borderRadius: BorderRadius.circular(24)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          onPressed: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const LockerContentScreen()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  lockerContent,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 15.sp),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

class LeftTopKycVerticalWidget extends StatelessWidget {
  const LeftTopKycVerticalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 4.h,
          width: 7.w,
          child: Image.asset(
            timeMenu,
          ),
        ),
        SizedBox(
          height: 3.h,
          child: CustomPaint(
              size: const Size(1, double.infinity),
              painter: DashedLineVerticalPainter()),
        ),
        SizedBox(
          height: 4.h,
          width: 8.w,
          child: const Icon(
            Icons.check_circle_outline,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 3.h,
          child: CustomPaint(
              size: const Size(1, double.infinity),
              painter: DashedLineVerticalPainter()),
        ),
        SizedBox(
          height: 4.h,
          width: 8.w,
          child: const Icon(
            Icons.account_circle_sharp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}


