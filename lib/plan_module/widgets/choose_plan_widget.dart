import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '/plan_module/data_model/bloc/choose_plan_bloc.dart';
import '/plan_module/data_model/model/choose_plan_model.dart';
import '/utils/color_theme.dart';
import '/utils/common_file.dart';
import '/utils/string.dart';

Widget selectionItemWidget(state, choosePlanBloc) {
  return ListView.builder(
    itemCount: state.choosePlanModel.length,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Material(
          color: state.choosePlanModel[index].isSelected!
              ? const Color(0xffFFF7EA)
              : Colors.white,
          elevation: 1,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () {
              onPlanChooseTap(index, context, choosePlanBloc);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Radio(
                          value:
                              state.choosePlanModel[index].isSelected as bool,
                          groupValue: true,
                          onChanged: (value) {
                            onPlanChooseTap(index, context, choosePlanBloc);
                          }),
                      Text(
                          "${state.choosePlanModel[index].months.toString()} Months"),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                          "₹ ${state.choosePlanModel[index].price.toString()} "),
                      const SizedBox(
                        height: 6,
                      ),
                      UtilsCommon().textWidget(
                          "₹ ${state.choosePlanModel[index].installment.toString()} Monthly",
                          10,
                          FontWeight.w700,
                          const Color(0xff5A953E))
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

Widget bottomWidgetSelection() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
      Color(0xffFFE79B),
      Color(0xffFFB81E),
    ])),
    alignment: Alignment.topCenter,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: const Padding(
            padding: EdgeInsets.all(2.0),
            child: Icon(
              Icons.check,
              color: Color(0xffFFE79B),
              size: 20,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UtilsCommon().textWidget(
                noSecurity, 14.sp, FontWeight.bold, Colors.black),
            const SizedBox(
              height: 8,
            ),
            FittedBox(
              child: UtilsCommon().textWidget(
                  oroSafe,
                  12.sp,
                  FontWeight.w500,
                  Colors.black),
            ),
          ],
        )
      ],
    ),
  );
}

Widget texPaybleWidget(state, choosePlanBloc) {
  return Column(
    children: [
      planChooseWidget(state, choosePlanBloc),
      bottomWidgetSelection(),
      const SizedBox(
        height: 16,
      ),
      UtilsCommon().textWidget(
          "Tax payable (18%): ₹${getTax(state.choosePlanModel)}",
          16.sp,
          FontWeight.w600,
          Colors.black)
    ],
  );
}

Widget planChooseWidget(state, choosePlanBloc) {
  return SizedBox(
    height: 40.h,
    child: ListView.builder(
      itemCount: state.choosePlanModel.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Material(
            color: state.choosePlanModel[index].isSelected!
                ? const Color(whiteDark)
                : Colors.white,
            elevation: 1,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () {
                onPlanChooseTap(index, context, choosePlanBloc);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                            value:
                                state.choosePlanModel[index].isSelected as bool,
                            groupValue: true,
                            onChanged: (value) {
                              onPlanChooseTap(index, context, choosePlanBloc);
                            }),
                        Text(
                            "${state.choosePlanModel[index].months.toString()} Months"),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                            "₹ ${state.choosePlanModel[index].price.toString()} "),
                        const SizedBox(
                          height: 6,
                        ),
                        UtilsCommon().textWidget(
                            "₹ ${state.choosePlanModel[index].installment.toString()} Monthly",
                            10,
                            FontWeight.w700,
                            const Color(greenColor))
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

getTax(List<ChoosePlanModel> model) {
  String text = "";
  int value = 0;
  double tax = 0;
  for (var element in model) {
    if (element.isSelected == true) value = element.price!;
  }
  tax = (value / 100) * 18;
  text = (tax.toInt()).toString();

  return text;
}

onPlanChooseTap(index, context, choosePlanBloc) {
  choosePlanBloc!.add(GetChoosePlanEvent(index: index, context: context));
}
