import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/utils/colors.dart';
import 'package:gym_app/features/Screens/set_up/presentation/screens_Setup/sc_408.dart';

class Sc407 extends StatefulWidget {
  final String sex;
  final double height;
  final double weight;
  final int age;
  const Sc407({
    super.key,
    required this.sex,
    required this.age,
    required this.height,
    required this.weight,
  });

  @override
  State<Sc407> createState() => _Sc407State();
}

class _Sc407State extends State<Sc407> {
  String select = 'B';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Physical Activity Level",
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
                padding: const EdgeInsets.all(8.0),
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
                height: 80.h,
              ),
              SizedBox(
                height: 0.06.sh,
                width: 0.6.sw,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: select == 'B' ?
                        WidgetStatePropertyAll(AppColors.secondaryColor) : null,
                    maximumSize: WidgetStatePropertyAll(Size(200, 50)),
                  ),
                  onPressed: () {
                    setState(() {
                      select = 'B';
                    });
                  },
                  child: Text(
                    "Beginner",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: AppColors.primaryColor,
                        fontSize: 25.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 0.06.sh,
                width: 0.6.sw,
                child: ElevatedButton(
                  style: ButtonStyle(
                
                     backgroundColor: select == 'I' ?
                        WidgetStatePropertyAll(AppColors.secondaryColor) : null,
                  maximumSize: WidgetStatePropertyAll(Size(200, 50)),
                  ),
                  onPressed: () {
                    setState(() {
                      select = 'I';
                    });
                  },
                  child: Text(
                    "Intermediate",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: AppColors.primaryColor,
                        fontSize: 25.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 0.06.sh,
                width: 0.6.sw,
                child: ElevatedButton(
                  style: ButtonStyle(
                         backgroundColor: select == 'A' ?
                        WidgetStatePropertyAll(AppColors.secondaryColor) : null,
                      maximumSize: WidgetStatePropertyAll(Size(200, 50)),
                  ),
                  onPressed: () {
                    setState(() {
                      select = 'A';
                    });
                  },
                  child: Text(
                    "Advanced",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: AppColors.primaryColor,
                        fontSize: 25.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 140.h,
              ),
              OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(AppColors.blackColor),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                        20,
                      )))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sc408(
                          sex: widget.sex,
                          age: widget.age,
                          height: widget.height,
                          weight: widget.weight,
                        ),
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
