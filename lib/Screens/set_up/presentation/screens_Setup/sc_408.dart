import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/Logic/cubit/startbutton_cubit.dart';
import 'package:gym_app/core/utils/colors.dart';
import 'package:gym_app/Widgets/widgets_Setup/textfield.dart';
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
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Profile successfully updated!")),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white70,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundImage: _file != null
                          ? FileImage(_file!)
                          : const AssetImage('assets/images/profile.png')
                              as ImageProvider,
                    ),
                    IconButton(
                      onPressed: getImage,
                      icon: Icon(
                        Icons.edit,
                        size: 20.r,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextField("Full name", nameController.text),
                      buildTextField("Nickname", nicknameController.text),
                      buildTextField("Email", emailController.text),
                      buildTextField("Mobile Number", passwordController.text),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  width: 200.w,
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
                              nicknameController.text,
                            );
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
      ),
    );
  }
}
