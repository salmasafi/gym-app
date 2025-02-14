import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/presentation/widgets/textfield.dart';
import 'package:gym_app/core/utils/colors.dart';

class Sc408 extends StatelessWidget {
  const Sc408({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.secondaryColor),
        title: Text(
          "Back",
          style: TextStyle(
            fontFamily: "LeagueSpartan",
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.secondaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                 SizedBox(height: 10.h),
                Text(
                  "Fill Your Profile",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteColor,
                  ),
                ),
                 SizedBox(height: 25.h),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.dm),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),

            Container(
              color: AppColors.primaryColor,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Stack(
                  children: [
                     CircleAvatar(
                      radius: 50.dm,
                      backgroundImage: AssetImage('assets/images/girl.png'),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.yellow,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        padding:  EdgeInsets.all(5.dm),
                        child: const Icon(
                          Icons.edit,
                          size: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

             SizedBox(height: 20.h),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.dm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextField("Full name", "Madison Smith"),
                  buildTextField("Nickname", "Madison"),
                  buildTextField("Email", "madisons@example.com"),
                  buildTextField("Mobile Number", "+123 567 89000"),
                ],
              ),
            ),

             SizedBox(height: 30.h),

            // Start Button
            SizedBox(
              width: 200.h,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child:  Text(
                  "Start",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color:AppColors.blackColor,
                  ),
                ),
              ),
            ),

             SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
