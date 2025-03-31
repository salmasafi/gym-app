import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/features/Logic/Cubit/cubit/bmi_info_request_cubit.dart';
import 'package:gym_app/features/set_up/presentation/screens/sc_406.dart';

import '../../../../core/utils/colors.dart';

class Sc405 extends StatefulWidget {
  const Sc405({super.key});

  @override
  State<Sc405> createState() => _Sc401State();
}

class _Sc401State extends State<Sc405> {
  int height = 165;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Back",
              style: TextStyle(
                  fontFamily: "LeagueSpartan",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondaryColor),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors.blackColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "What Is Your Height?",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 25.sp),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: TextStyle(
                  fontFamily: "LeagueSpartan",
                  color: AppColors.greyColor,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "${height.toInt()} Cm",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 60.sp,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w800),
            ),
            BlocBuilder<BmiInfoRequestCubit, BmiInfoRequestState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: AppColors.primaryColor,
                                inactiveTrackColor: AppColors.primaryColor,
                                thumbColor: AppColors.secondaryColor,
                                overlayColor:
                                    AppColors.secondaryColor.withValues(),
                                trackHeight: 50,
                                thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 20),
                              ),
                              child: BlocBuilder<BmiInfoRequestCubit,
                                  BmiInfoRequestState>(
                                builder: (context, state) {
                                  return Slider(
                                    min: 140,
                                    max: 220,
                                    value: height.toDouble(),
                                    onChanged: (value) {
                                      setState(() {
                                        height = value.toInt();
                                        context
                                            .read<BmiInfoRequestCubit>()
                                            .getHeightValue(height.toString());

                                        context
                                            .read<BmiInfoRequestCubit>()
                                            .getHeightUnit("Cm");
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 40.h,
            ),
            OutlinedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.blackColor),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sc406(),
                  ),
                );
              },
              child: Text(
                "Continue",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
