import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '/home_module/screens/home_screen.dart';
import '/plan_module/data_model/model/choose_plan_model.dart';
import '/utils/common_file.dart';
import '/utils/string.dart';
import '../../repository/choose_plan_json.dart';

part 'choose_plan_event.dart';
part 'choose_plan_state.dart';

class ChoosePlanBloc extends Bloc<ChoosePlanEvent, ChoosePlanState> {
  UtilsCommon utilsCommon = UtilsCommon();

  ChoosePlanBloc() : super(ChoosePlanInitial()) {
    List<ChoosePlanModel> choosePlanModel =
        list.map((e) => ChoosePlanModel.fromJson(e)).toList();
    emit(ChoosePlanLoading(choosePlanModel: choosePlanModel));
    on<GetChoosePlanEvent>((event, emit) {
      try {
        List<ChoosePlanModel> choosePlanModel =
            list.map((e) => ChoosePlanModel.fromJson(e)).toList();
        choosePlanModel[event.index].isSelected = true;
        emit(ChoosePlanLoaded(choosePlanModel: choosePlanModel));

        showModalBottomSheet(
            context: event.context,
            builder: (context) {
              bool flag = false;
              return BottomSheet(
                  enableDrag: false,
                  onClosing: () {},
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xffFFE9BF),
                                Color(0xffFFE9BF),
                                Colors.white
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0, 0.5, 1])),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              _qualityWidget(duration,
                                  "${getMonths(choosePlanModel)} $months"),
                              const Spacer(),
                              _qualityWidget(amountInc,
                                  "₹ ${getInstallments(choosePlanModel)}"),
                            ],
                          ),
                          const Spacer(),
                          StatefulBuilder(builder: (context, setState) {
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() => flag = !flag);
                                  },
                                  child: SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: Checkbox(
                                      activeColor: Colors.white,
                                      checkColor: const Color(0xff5A953E),
                                      side: const BorderSide(
                                          color: Color(0xff5A953E)),
                                      focusColor: const Color(0xff5A953E),
                                      value: flag,
                                      onChanged: (value) {
                                        setState(() => flag = value!);
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                utilsCommon.textWidget(iAgree, 12.sp,
                                    FontWeight.w300, Colors.black)
                              ],
                            );
                          }),
                          const Spacer(),
                          utilsCommon.customGradientButton(confirmPlan, () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                                (Route<dynamic> route) => false);
                          }, false),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    );
                  });
            });
      } catch (e) {
        print(e.toString());
      } // TODO: implement event handler
    });
  }
}

getMonths(List<ChoosePlanModel> model) {
  String text = "";
  for (var element in model) {
    if (element.isSelected == true) text = element.months.toString();
  }
  return text;
}

getInstallments(List<ChoosePlanModel> model) {
  String text = "";
  for (var element in model) {
    if (element.isSelected == true) text = element.installment.toString();
  }
  return text;
}

_qualityWidget(text1, text2) {
  UtilsCommon utilsCommon = UtilsCommon();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      utilsCommon.textWidgetPlan(
        text1,
        14.sp,
        FontWeight.w500,
        const Color(0xff919191),
      ),
      const SizedBox(
        height: 8,
      ),
      utilsCommon.textWidgetPlan(
          text2, 24, FontWeight.w600, const Color(0xff454545))
    ],
  );
}
