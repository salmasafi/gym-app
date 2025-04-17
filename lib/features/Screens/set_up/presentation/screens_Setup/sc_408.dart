import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/Logic/cubit/startbutton_cubit.dart';
import 'package:gym_app/core/utils/colors.dart';
import 'package:gym_app/features/Widgets/widgets_Setup/textfield.dart';
import 'package:image_picker/image_picker.dart';

class Sc408 extends StatefulWidget {
  final String sex;
  final double height;
  final double weight;
  final int age;
  const Sc408({
    super.key,
    required this.sex,
    required this.age,
    required this.height,
    required this.weight,
  });

  @override
  State<Sc408> createState() => _Sc408State();
}

class _Sc408State extends State<Sc408> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  File? _file;
  Future getImage() async {
    final myImage = await ImagePicker().pickImage(source: ImageSource.gallery);
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
          } else if (state is StartbuttonError){
               ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text("There is an error, please try again, ${state.e}")),
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
                      buildTextField("Password", passwordController.text),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  width: 200.w,
                  height: 50.h,
                  child:  ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                        onPressed: () {
                        
                            context.read<StartbuttonCubit>().register(
                                  context,
                                  emailController.text,
                                  nameController.text,
                                  widget.age,
                                  widget.sex,
                                  imageController.text,
                                  widget.weight,
                                  widget.height,
                                  passwordController.text,
                                  nicknameController.text,
                                );
                          
                        },
                        child: state is StartbuttonLoading ? Center(child: CircularProgressIndicator(),) : Text(
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
