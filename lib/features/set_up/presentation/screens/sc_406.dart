import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/utils/colors.dart';
import 'package:gym_app/features/set_up/presentation/screens/sc_407.dart';

class Sc406 extends StatefulWidget {
  const Sc406({super.key});

  @override
  State<Sc406> createState() => _Sc406State();
}

class _Sc406State extends State<Sc406> {
  bool gain = false;
  bool shape = false;
  bool lose = false;
  bool muscle = false;
  bool other = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.secondaryColor),
        title: Row(
          children: [
            Text(
              "Back",
              style: TextStyle(
                  fontFamily: "LeagueSpartan",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondaryColor),
              textAlign: TextAlign.left,
            )
          ],
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors.blackColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "What Is Your Goal?",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 25.sp),
            ),
            Padding(
              padding: EdgeInsets.all(8.0.dm),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              width: double.infinity,
              height: 0.6.sh,
              color: AppColors.primaryColor,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SizedBox(
                    //   height: 30.h,
                    // ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.dm),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.dm),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.dm),
                            child: Text(
                              "Lose Weight",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Checkbox(
                            value: lose,
                            onChanged: (value) => setState(
                              () {
                                lose = value!;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.dm),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.dm),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.dm),
                            child: Text(
                              "Gain Weight",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Checkbox(
                            value: gain,
                            onChanged: (value) => setState(
                              () {
                                gain = value!;
                              },
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.dm),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.dm),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.dm),
                            child: Text(
                              "Muscle Mass Gain",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Checkbox(
                            value: muscle,
                            onChanged: (value) => setState(
                              () {
                                muscle = value!;
                              },
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.dm),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.dm),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.dm),
                            child: Text(
                              "Shape Body",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Checkbox(
                            value: shape,
                            onChanged: (value) => setState(
                              () {
                                shape = value!;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.dm),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.dm),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.dm),
                            child: Text(
                              "Others",
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Checkbox(
                            value: other,
                            onChanged: (value) => setState(
                              () {
                                other = value!;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            OutlinedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(AppColors.blackColor),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      20.dm,
                    )))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sc407(),
                      ));
                },
                child: Text(
                  "Continue",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.whiteColor),
                ))
          ],
        ),
      ),
    );
  }
}
