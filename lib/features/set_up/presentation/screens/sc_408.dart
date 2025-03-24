import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/Logic/cubit/startbutton_cubit.dart';
import 'package:gym_app/core/utils/colors.dart';
import 'package:gym_app/features/Logic/service/API/APIservices.dart';
import 'package:gym_app/features/Logic/service/API/BMI_Endpoint.dart';
import 'package:gym_app/features/set_up/presentation/widgets/textfield.dart';
import 'package:image_picker/image_picker.dart';

class Sc408 extends StatefulWidget {
  const Sc408({super.key});

  @override
  State<Sc408> createState() => _Sc408State();
}

class _Sc408State extends State<Sc408> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final int password = 123456899;

  File? _file;
  Future getImage() async {
    final myImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (myImage == null) return;

    setState(() {
      _file = File(myImage.path);
    });
  }

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
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.secondaryColor,
          ),
        ),
      ),
      body: BlocConsumer<StartbuttonCubit, StartbuttonState>(
        listener: (context, state) {
          if (state is StartbuttonSuccess) {
            // Handle success (e.g., show a success message or navigate to another screen)
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Profile successfully updated!")),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
<<<<<<< HEAD
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
                        padding: EdgeInsets.all(5.dm),
                        child: const Icon(
                          Icons.edit,
                          size: 15,
                          color: Colors.black,
=======
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
>>>>>>> e5fa348127a5a97fff24bf7a33f4446de2abf399
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

<<<<<<< HEAD
            SizedBox(height: 20.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.dm),
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
                onPressed: () {
                  ApiService apiService = ApiService();

                  BMI_Request bmiRequest = BMI_Request(
                    weightvalue: "70",
                    weightunit: "kg",
                    heightvalue: "180",
                    heightunit: "cm",
                    sex: "Male",
                    age: "25",
                    waist: "80",
                    hip: "90",
                  );

                  apiService.sendBMI(bmiRequest).then((response) {
                    if (response != null) {
                      print("✅ BMI API Response: $response");
                    } else {
                      print("❌ Failed to send BMI data");
                    }
                  });
                },
                child: Text(
                  "Start",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
=======
                Container(
                  color: AppColors.primaryColor,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                          backgroundImage: _file != null
                              ? FileImage(_file!)
                              : AssetImage('assets/images/profile.png')
                                  as ImageProvider,
                          // AssetImage('assets/images/profile.png'),
                        ),
                        Positioned(
                          bottom: 0.1.r,
                          right: 0.1.r,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow,
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    getImage();
                                  });
                                },
                                icon: Icon(
                                  Icons.edit,
                                  size: 15,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.dm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextField("Full name", nameController.text),
                      buildTextField("Nickname", nicknameController.text),
                      buildTextField("Email", emailController.text),
                      buildTextField("Mobile Number", passwordController.text),
                    ],
>>>>>>> e5fa348127a5a97fff24bf7a33f4446de2abf399
                  ),
                ),

<<<<<<< HEAD
            SizedBox(height: 30.h),
          ],
        ),
=======
                SizedBox(height: 30.h),

                // Start Button
                SizedBox(
                  width: 200.h,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    onPressed: () {
                      if (state is StartbuttonInitial) {
                        context.read<StartbuttonCubit>().postdata(
                            context,
                            emailController.text,
                            nameController.text,
                            25,
                            "M",
                            imageController.text,
                            70,
                            170,
                            passwordController.text,
                            nicknameController.text);

                        print("data is sent to the api ");
                      } else if (state is StartbuttonLoading) {
                        CircularProgressIndicator(color: AppColors.blackColor);
                      }
                    },
                    child: Text(
                      "Start",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30.h),
              ],
            ),
          );
        },
>>>>>>> e5fa348127a5a97fff24bf7a33f4446de2abf399
      ),
    );
  }
}
