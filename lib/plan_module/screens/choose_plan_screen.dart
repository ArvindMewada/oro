import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/plan_module/widgets/choose_plan_widget.dart';
import '/utils/common_file.dart';
import '/utils/image_assets_file.dart';
import '/utils/string.dart';
import '../data_model/bloc/choose_plan_bloc.dart';

class ChoosePlanScree extends StatefulWidget {
  const ChoosePlanScree({Key? key}) : super(key: key);

  @override
  State<ChoosePlanScree> createState() => _ChoosePlanScreeState();
}

class _ChoosePlanScreeState extends State<ChoosePlanScree> {
  ChoosePlanBloc? choosePlanBloc;

  UtilsCommon utilsCommon = UtilsCommon();

  @override
  Widget build(BuildContext context) {
    choosePlanBloc = BlocProvider.of(context);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(processIcon),
              ),
            ),
            actions: const [
              CloseButton(
                color: Colors.black,
              )
            ],
            title: utilsCommon.textWidget(
                chooseAndPay, 18, FontWeight.w700, Colors.black),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<ChoosePlanBloc, ChoosePlanState>(
              builder: (context, state) {
                if (state is ChoosePlanLoaded) {
                  return texPaybleWidget(state, choosePlanBloc);
                } else if (state is ChoosePlanLoading) {
                  onPlanChooseTap(0, context, choosePlanBloc);
                  return selectionItemWidget(state, choosePlanBloc);
                }
                return const CircularProgressIndicator();
              },
            ),
          )),
    );
  }
}
