import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oro_sample/utils/custom_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '/plan_module/data_model/bloc/choose_plan_bloc.dart';
import '/plan_module/screens/choose_plan_screen.dart';
import '/utils/common_file.dart';
import '/utils/string.dart';

class LockerContentScreen extends StatelessWidget {
  const LockerContentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(
            color: Colors.black,
          ),
          title: UtilsCommon()
              .textWidget(lockerContent, 18, FontWeight.w700, Colors.black),
        ),
        body: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.55,
                      mainAxisSpacing: 14,
                      crossAxisSpacing: 12,
                    ),
                    itemCount: 3,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return const CustomCard();
                    }),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.w),
          width: double.infinity,
          height: 6.h,
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => ChoosePlanBloc(),
                    child: const ChoosePlanScree(),
                  ),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Pay",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ],
            ),
          ),
        ));
  }
}
