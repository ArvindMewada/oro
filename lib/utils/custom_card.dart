import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '/utils/common_file.dart';
import '/utils/string.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  UtilsCommon utilsCommon = UtilsCommon();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 12.h,
            color: const Color(0xffF9F9F9),
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Center(
                child: utilsCommon.textWidget(
                    sealPhotoAll, 14.sp, FontWeight.w500, Colors.black)),
          ),
          SizedBox(height: 1.h),
          Center(
              child: utilsCommon.textWidget(
                  number, 14.sp, FontWeight.w500, Colors.black)),
          SizedBox(height: 2.h),
          Row(
            children: [
              utilsCommon.textWidget(
                  neckLess, 14.sp, FontWeight.w500, const Color(0xff454545)),
              const Spacer(),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                      color: const Color(0xffFFF7EA),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      )),
                  child: utilsCommon.textWidget(quantityTwo, 13.sp,
                      FontWeight.w500, const Color(0xff454545))),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _qualityWidget(quantity, caret)),
              Expanded(child: _qualityWidget(stoneWeight, gram)),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _qualityWidget(grossWeight, halfGram)),
              Expanded(child: _qualityWidget(netWeight, fourG)),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          utilsCommon.customButton(),
        ],
      ),
    );
  }

  _qualityWidget(text1, text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        utilsCommon.textWidget(text1.toString().toUpperCase(), 12.sp,
            FontWeight.w600, const Color(0xff919191)),
        SizedBox(
          height: 1.h,
        ),
        utilsCommon.textWidget(
            text2, 12.sp, FontWeight.w600, const Color(0xff454545))
      ],
    );
  }
}
